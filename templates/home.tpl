{% extends "base.tpl" %}
{% load i18n %}
{% block title %}{% trans "Frayer Meter" %}{% endblock %}                                                                     
{% block main %}
  
<form action="" method="post">
  <div class="wrap">
    <div class="header"><a href=""><img src="http://i48.tinypic.com/24zvp4w.jpg" alt='{% trans "Frayer Meter" %}'></a></div>
    <img src="http://i47.tinypic.com/zji03n.jpg" class="clock" alt="clock">
    <div class="greenbox b1">
    {# <div id="costtop">מהו גובה התשלום<br />החודשי שלך?</div> #}
    <div id="costtop">{% trans "how high is<br/>your monthly payment?" %}
    <div class="bottom"><label for="imoney">{% trans "monthly payment:" %}</label>
      {{ form.cost }}
      {# <input type="text" name="cost" id="cost"> #}
    </div>
  </div>

  <div class="greenbox b2">
    <div id="minutestop">{% trans "how many minutes<br />speak each month?" %}</div>
    {# <div id="minutestop">כמה דקות את/ה<br />מדבר/ת בחודש?</div> #}
    <div class="bottom"><label for="iminutes">{% trans "monthly minutes:" %}</label>
      {{ form.minutes }}
      {# <input type="text" name="minutes" id="minutes"> #}
    </div>
  </div>

  <div class="greenbox b3">
  <div id="smstop">{% trans "how many texts< br/>do you send each month?" %}</div>
  {# <div id="smstop">כמה סמסים את/ה<br />שולח/ת בחודש?</div> #}
  <div class="bottom"><label for="isms">{% trans "monthly texts:" %}</label>
    {{ form.sms }}
    {# <input type="text" name="sms" id="sms"> #}
  </div>
  </div>

  <input type="image" name="send" id="send" src="http://i46.tinypic.com/67nwar.jpg" class="button" />

  </div>
</form>
{% endblock %}