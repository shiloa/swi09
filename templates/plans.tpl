{% extends "base.tpl" %}
{% load i18n %}

{% block title %}
{% endblock %}

{% block main %}
<div style="width:700;margin:auto">
You pay {{ price }}
    {% if saved %}
<h2> but you can save </h2>
<h1> {{ plans.0.1 }} shek !!</h1>
<ul>
{% for plan in plans %}
<li>You can save {{ plan.1 }} every month with plan {{ plan.2 }} (Costs only {{ plan.0 }} per month) </li>
{% endfor %}
</ul>
{% else %}
<h3> and can save nothing ! </h3>
    {% endif %}
</div>
{% endblock %}

