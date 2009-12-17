{% extends "base.tpl" %}
{% load i18n %}

{% block title %}
{% endblock %}

{% block main %}
Best plans:

You pay {{ price }}
<ul>
{% for plan in plans %}
You can save {{ plan.1 }} every month with plan {{ plan.2 }} (Costs only {{ plan.0 }} per month)
{% endfor %}
</ul>
{% endblock %}
