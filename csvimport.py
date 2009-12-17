# -*- coding: utf-8 -*-

import csv
import os, time, sys
import sqlite3
from decimal import Decimal
from theapp.models import *
from pdb import set_trace as debugger

def read_csv(file_path):
    """read plans.csv file and loads it to db"""
    
    if os.path.isfile(file_path):
        
        d = csv.DictReader(open(file_path, 'r'))
        
        for row in d:
            # add company
            company_name = row['company']
            company = Company.objects.filter(name=company_name)
            if not company:
                company = Company(name=company_name)
                company.save()
            else:
                company = company[0]# plan
            
            debugger
            # add plan
            plan = form_plan(row)
            plan.company_id= company.id
            try:
                plan.save()
            except:
                raise ValueError(plan)
            
            # add steps
            add_steps(row, plan)
        
        del d    
            
def form_plan(row):
    """docstring for form_pan"""
     
    name = row['plan']
    flat_rate = Decimal(unicode(row['new_flat_rate'], "ascii"))._rescale(-2, 'ROUND_DOWN')
    base_minutes = int(row['plan_included_min'])
    base_sms = int(row['pkg_includes_sms'])
    base_sms_rate = Decimal(row['price_per_sms'])._rescale(-2, 'ROUND_DOWN')
    base_min_rate = Decimal(row['price_per_inc_min'])._rescale(-2, 'ROUND_DOWN')
    details = u''
    
    plan = Plan(name=name, flat_rate=flat_rate, base_minutes=base_minutes, 
                base_sms=base_sms, base_sms_rate=base_sms_rate, base_min_rate=base_min_rate,
                details=details)
    
    return plan

"""
company	
plan	
new_flat_rate	
plan_included_min --> base min
first_step_starts_at --> plan.step1.starts_at
first_step_cost	 --> plan.step.unit_cost
second_step_start --> plan.step1.ends_at = plan.step2.starts_at
second_step_cost --> plan.step1.unit_cost
pkg_includes_sms --> base_sms	
sms_beyond_pkg 																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												

classification = models.CharField(max_length=45, verbose_name=_(u'step classification'), choices=zip(STEP_TYPES, STEP_TYPES))
unit_cost = models.DecimalField(max_digits=5, decimal_places=2, verbose_name=_(u'unit cost in this step'))
plan = models.ForeignKey('Plan', verbose_name=_(u'plan for this pricing step'))
starts_at = models.IntegerField(verbose_name=_(u'pricing starts at (number)'))
ends_at = models.IntegerField(verbose_name=_(u'pricing ends at (number)'))

"""
def add_steps(row, plan):
    STEP_TYPES = ( u'Plan Text Message', u'Plan Minutes', )
    
    # add minutes steps
    starts_at = int(row['first_step_starts_at'])
    ends_at = int(row['second_step_start'])
    
    first_cost = Decimal(row['first_step_cost'])._rescale(-2, 'ROUND_DOWN')
    second_cost = Decimal(row['second_step_cost'])._rescale(-2, 'ROUND_DOWN')

    # 2 minute steps (form 2 step objects)
    if starts_at and ends_at:
        classification = STEP_TYPES[1]
        s1 = Step(classification=STEP_TYPES[1], plan_id=plan.id, starts_at=starts_at, ends_at=ends_at, unit_cost=first_cost)
        s1 = Step(classification=STEP_TYPES[1], plan_id=plan.id, starts_at=starts_at, ends_at=ends_at, unit_cost=first_cost)
        s2 = Step(classification=STEP_TYPES[1], plan_id=plan.id, starts_at=ends_at, ends_at=1e4, unit_cost=second_cost)
        s1.save()
        s2.save()
    elif starts_at:
        s1 = Step(classification=STEP_TYPES[1], plan_id=plan.id, starts_at=starts_at, ends_at=1e4, unit_cost=first_cost)
    
    # save sms step
    extra_sms_cost = Decimal(row['sms_beyond_pkg'])._rescale(-2, 'ROUND_DOWN')
    included_sms = int(row['pkg_includes_sms'])
    if extra_sms_cost:
        starts_at = included_sms
        s3 = Step(classification=STEP_TYPES[0], plan_id=plan.id, starts_at=starts_at, ends_at=1e4, unit_cost=extra_sms_cost)
        s3.save()

def main():
    file_path = os.path.join(os.path.dirname(__file__), 'misc/plans.csv')
    read_csv(file_path)
    
if __name__ == '__main__':
    main