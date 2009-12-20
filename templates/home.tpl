{% extends "base.tpl" %}
{% block main %}

{% load i18n %}

<form action="" method="post" style="margin-top: -0.5em;">
  <div class="wrap">

    <div class="header"><a href="{% url home_page %}"><img src="http://i48.tinypic.com/24zvp4w.jpg" alt='{% trans "Frayer Meter" %}'></a></div>

    <img src="http://i47.tinypic.com/zji03n.jpg" class="clock" alt="clock">

    <div class="greenbox b1">
      <div id="costtop" {% if not LANGUAGE_BIDI %}style="font-size: smaller;" dir="ltr"{% endif %}>
        {% trans "how high is" %}<br/>{% trans "your monthly bill?" %}
        <div class="textbox">{{ form.cost }}</div>
      </div>
      <div class="errormsg">
        {% if form.cost.errors %} {% for err in form.cost.errors %}{{ err }}<br/>{% endfor %} {% endif %}
      </div>
   </div>

  <div class="greenbox b2">
    <div id="minutestop" {% if not LANGUAGE_BIDI %}style="font-size: smaller;" dir="ltr"{% endif %} >
      {% trans "how many minutes do" %}<br />{% trans "you speak each month?" %}
      <div class="textbox">{{ form.minutes }}</div>
    </div>
    <div class="errormsg">
      {% if form.minutes.errors %} {% for err in form.minutes.errors %}{{ err }}<br/> {% endfor %} {% endif %}
    </div>
  </div>

  <div class="greenbox b3">
    <div id="smstop" {% if not LANGUAGE_BIDI %}style="font-size: smaller;" dir="ltr"{% endif %}>
      {% trans "how many texts" %}<br />{% trans "do you send each month?" %}
      <div class="textbox">{{ form.sms }}</div>
    </div>
    <div class="errormsg">
      {% if form.sms.errors %} {% for err in form.sms.errors %}  {{ err }}<br/> {% endfor %} {% endif %}
    </div>
  </div>

  <input type="image" name="send" id="send" src="http://i46.tinypic.com/67nwar.jpg" class="button" />

  </div>
</form>
{% endblock %}
