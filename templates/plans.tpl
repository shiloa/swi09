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
{% for plan in plans %} 
<tr>
<td> {{ plan.0 }} </td>
<td> {{ plan.1 }} </td> 
<td> {{ plan.2 }} </td>
<td><a href=""><img src="http://i45.tinypic.com/2va1e1c.jpg" alt="הירשם וחסוך" /></a></td>
<tr>
 {% endfor %} 
 
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
