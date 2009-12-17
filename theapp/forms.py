from theapp.models import UserInfo

from django.forms import ModelForm

class UserInfoForm(ModelForm):
    class Meta:
        model = UserInfo


