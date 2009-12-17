from django.db import models

COMPANY = (
        (1, 'Orange'),
        (2, 'Cellcom'),
        (3, 'Pelephone'),
        )

class UserInfo(models.Model):
    ''' User usage information '''
    company = models.SmallIntegerField(max_length=1, choices=COMPANY)
    minutes = models.PositiveIntegerField()
    sms = models.PositiveIntegerField()
    cost = models.PositiveIntegerField()
    phone = models.PositiveIntegerField(null=True, blank=True)
    sent_to_agent = models.SmallIntegerField(max_length=1, default=0, null=True, blank=True)

    def __unicode__(self):
        return u'%d at %s' % (self.cost, self.company)
