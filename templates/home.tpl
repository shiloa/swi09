{% extends "base.tpl" %}
{% load i18n %}
{% block main %}
<link rel="stylesheet" href="/static/css/base1.css" type="text/css" media="screen" />
<form action="" method="post">
  <div class="wrap">
    <div class="header"><a href=""><img src="http://i48.tinypic.com/24zvp4w.jpg" alt='{% trans "Frayer Meter" %}'></a></div>
    <img src="http://i47.tinypic.com/zji03n.jpg" class="clock" alt="clock">
    <div class="greenbox b1">
      {# <div id="costtop">מהו גובה התשלום<br />החודשי שלך?</div> #}
      <div id="costtop">
        {% trans "how high is" %}<br/>{% trans "your monthly payment?" %}
      </div>
      <div class="bottom">
        {{ form.cost }}
      {% if form.cost.errors %} {% for err in form.cost.errors %} <br> {{ err }} {% endfor %} {% endif %}
      </div>
   </div>

  <div class="greenbox b2">
    <div id="minutestop">
      {% trans "how many minutes" %}<br />{% trans "speak each month?" %}
    </div>
    {# <div id="minutestop">כמה דקות את/ה<br />מדבר/ת בחודש?</div> #}
    <div class="bottom">
      {{ form.minutes }} 
      {% if form.minutes.errors %} {% for err in form.minutes.errors %} <br> {{ err }} {% endfor %} {% endif %}
    </div>
  </div>

  <div class="greenbox b3">
    <div id="smstop">
      {% trans "how many texts" %}<br />{% trans "do you send each month?" %}
    </div>
    {# <div id="smstop">כמה סמסים את/ה<br />שולח/ת בחודש?</div> #}
    <div class="bottom">
      {{ form.sms }} 
      {% if form.sms.errors %} {% for err in form.sms.errors %} <br> {{ err }} {% endfor %} {% endif %}
    </div>
  </div>

  <input type="image" name="send" id="send" src="http://i46.tinypic.com/67nwar.jpg" class="button" />

  </div>
</form>
{% endblock %}
