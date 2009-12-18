{% extends "base.tpl" %}
{% load i18n %}
{% block title %}{% trans "plans" %}{% endblock %}
{#  #}
{# {% block main %} #}
{# Best plans: #}
{#  #}
{# You pay {{ price }} #}
{# <ul> #}
{# {% for plan in plans %} #}
{#   {% trans "You can save" %} {{ plan.1 }} {% trans "every month with plan" %} {{ plan.2 }}  #}
{#   {% trans "(Costs only" %} {{ plan.0 }} {% trans "per month" %} #}
{# {% endfor %} #}
{# </ul> #}
{# {% endblock %} #}

{% block main %}
<link rel="stylesheet" href="/static/css/base1.css" type="text/css" media="screen" />
<div class="wrap">
  <div class="header"><a href=""><img src="http://i49.tinypic.com/9r3ce8.jpg" alt='{% trans "FrayerMeter" %}' style="margin-top:2px"></a></div>

  <div style="padding:20px;">
    <div>
      <div id="progress">
        <div id="progress-inner"></div>
      </div>
      <div>
        <form method="get" action="">
          <label for="imoney">{% trans "monthly payment:" %}</label><input type="text" name="cost" id="cost"><br /><br />
          <label for="iminutes">{% trans "monthly mintues:" %}</label><input type="text" name="minutes" id="minutes"><br /><br />
          <label for="isms">{% trans "monthly texts:" %}</label><input type="text" name="sms" id="sms"><br /><br />
          <input type="image" name="send" id="send" src="http://i46.tinypic.com/d5e0p.jpg" />
        </form>
      </div>
    </div>
  
    <div style="position:absolute;right:200px;top:230px;width:700px">
      <table style="width:100%;">
        <caption>you can save 100 shek every month!</caption>
        <tr class="th">
          <td>{% trans "cost per month" %}</td>
          <td>{% trans "annual cost" %}</td>
          <td>{% trans "plan name" %}</td>
        </tr> 
        <tr>
          <td>200</td>
          <td>600</td>
          <td>סלקום שמנמנים</td>
          <td><a href=""><img src="http://i45.tinypic.com/2va1e1c.jpg" alt="הירשם וחסוך" /></a></td>
        </tr>
      </table>
    </div>

  </div>
</div>
{% endblock %}

{% block pagescripts %}
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
  <script type="text/javascript" charset="utf-8">
     $( function(){
       setTimeout("$('#progress-inner').animate({ height: '30%' }, 3000, 'swing')", 500);
     });
  </script>
{% endblock %}