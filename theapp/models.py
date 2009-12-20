# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext as _

class Company(models.Model):
    """this describes the service provider"""
    
    # the company's name
    name = models.CharField(max_length=50, verbose_name=_(u'company name'))
    
    def __unicode__(self):
        return self.name
    
    def _get_all_plans(self):
        return self.plan_set.all()
    plans = property(_get_all_plans)
        
    class Meta:
        """docstring for META"""
        db_table = 'companies'
        ordering = ['name']
        
        
class Plan(models.Model):
    """describes a cell phone plan"""
    
    name = models.CharField(max_length=50, verbose_name=_(u'plan name'))
    base_minutes = models.IntegerField(verbose_name=_(u'number of base minutes in plan'))
    flat_rate = models.DecimalField(max_digits=10, decimal_places=3, verbose_name=_(u'plan\'s flat rate (before additional costs) in NIS'))
    base_sms = models.IntegerField(verbose_name=_(u'number of included text messages in plan'))
    base_sms_rate = models.DecimalField(max_digits=10, decimal_places=3, verbose_name=_(u'price/sms in NIS'))
    base_min_rate = models.DecimalField(max_digits=10, decimal_places=3, verbose_name=_(u'price/min in NIS'))
    details = models.CharField(max_length=256, verbose_name=_(u'additional plan info'), blank=True)
    company = models.ForeignKey('Company', verbose_name=_(u'company'))
    is_active = models.BooleanField(verbose_name=_(u'plan active?'), default=True)
    
    def __unicode__(self):
        return self.name
    
    def _get_plan_steps(self):
        return self.step_set.all()
    steps = property(_get_plan_steps)

    def my_price(self, sms, minutes):
        ''' Calcuate the plan's cost for a specific sms/minutes combo '''
        total = self.flat_rate + self.base_minutes * self.base_min_rate
        if not self.base_minutes:
            total += minutes * self.base_min_rate
        
        for step in self.steps:

            if step.classification == Step.STEP_TYPES[0]:
                item = sms 
            else:
                item = minutes

            if item> step.starts_at:
                amount = step.ends_at if item > step.ends_at else item
                amount -= step.starts_at
                total += amount * step.unit_cost
        
        return total
        
    class Meta:
        db_table = 'plans'
        ordering = ['name']

class Step(models.Model):   
    """describes a plan's barrier after which cost is raised"""
    
    # plan step is either of the following types
    STEP_TYPES = (_(u'Plan Text Message'), _(u'Plan Minutes'), )
    
    classification = models.CharField(max_length=45, verbose_name=_(u'step classification'), choices=zip(STEP_TYPES, STEP_TYPES))
    unit_cost = models.DecimalField(max_digits=10, decimal_places=2, verbose_name=_(u'unit cost in this step'))
    plan = models.ForeignKey('Plan', verbose_name=_(u'plan for this pricing step'))
    starts_at = models.IntegerField(verbose_name=_(u'pricing starts at (number)'))
    ends_at = models.IntegerField(verbose_name=_(u'pricing ends at (number)'))
    
    def __unicode__(self):
        return u'%s - %s' % (self.plan, self.classification)
        
    class Meta:
        db_table = 'steps'
        ordering = ['classification']


class ContactRequest(models.Model):
    ''' Request by User to be contacted '''
    STATE = (
            (0, "Logged"),
            (1, "Passed to Agent"),
    )        

    minutes = models.PositiveIntegerField()
    sms = models.PositiveIntegerField()
    cost = models.PositiveIntegerField()

    phone = models.PositiveIntegerField(blank=True)
    date = models.DateField()

    state = models.SmallIntegerField(choices=STATE)

    def __unicode__(self):
        return u'Minutes: %d SMS: %d Cost: %d Phone: %d %s' % (self.minutes, self.sms, self.cost, self.phone, self.date)

class UserInfo(models.Model):
    ''' User usage information '''
    minutes = models.PositiveIntegerField()
    sms = models.PositiveIntegerField()
    cost = models.PositiveIntegerField()
    
    phone = models.PositiveIntegerField(null=True, blank=True)

    def __unicode__(self):
        return u'Minutes: %d SMS: %d Cost: %d' % (self.minutes, self.sms, self.cost)


