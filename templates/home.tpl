{% extends "base.tpl" %}
{% load i18n %}
{% block main %}
{% include "popup.tpl" %}
<link rel="stylesheet" href="/static/css/base1.css" type="text/css" media="screen" />
<form action="" method="post" style="margin-top: -0.5em;">
  <div class="wrap">
    <div class="header"><a href="{% url home_page %}"><img src="http://i48.tinypic.com/24zvp4w.jpg" alt='{% trans "Frayer Meter" %}'></a></div>
    <img src="http://i47.tinypic.com/zji03n.jpg" class="clock" alt="clock">
    <div class="greenbox b1">
      <div id="costtop">
        {% trans "how high is" %}<br/>{% trans "your monthly payment?" %}
        <span class="textbox">{{ form.cost }}</span>
      </div>
      <div class="errormsg">
        {% if form.cost.errors %} {% for err in form.cost.errors %}{{ err }}<br/>{% endfor %} {% endif %}
      </div>
   </div>

  <div class="greenbox b2">
    <div id="minutestop">
      {% trans "how many minutes do" %}<br />{% trans "you speak each month?" %}
      <br />
      <span class="textbox">{{ form.minutes }}</span>
    </div>
    <div class="errormsg">
      {% if form.minutes.errors %} {% for err in form.minutes.errors %}{{ err }}<br/> {% endfor %} {% endif %}
    </div>
  </div>

  <div class="greenbox b3">
    <div id="smstop">
      {% trans "how many texts" %}<br />{% trans "do you send each month?" %}
      <span class="textbox">{{ form.sms }}</span>
    </div>
    <div class="errormsg">
      {% if form.sms.errors %} {% for err in form.sms.errors %}  {{ err }}<br/> {% endfor %} {% endif %}
    </div>
  </div>

  <input type="image" name="send" id="send" src="http://i46.tinypic.com/67nwar.jpg" class="button" />

  </div>
</form>
{% endblock %}
