{% load i18n %}
<html {% if LANGUAGE_BIDI %}dir="rtl"{% endif %} lang="{{ LANGUAGE_CODE }}">
    <head>
        {% include "meta.tpl" %}
        <title>{% block title %}{% trans "Home" %}{% endblock %} &curren; {% trans "FrayerMeter" %}</title>
        <link rel="shortcut icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg">
        <link rel="icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg"></link>
        {% block headme %}
{% endblock %}
    </head>
    <body>
            {% block main %}{% endblock %}
        {% block footer %}
          <div id="footer"></div>
        {% endblock %}
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-10967567-5");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
    {% block javascript %}
        {# <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script> #}
        <script src="/static/js/jquery.min.js" type="text/javascript"></script>
        <script src="/static/js/jquery.ui.min.js" type="text/javascript"></script>
        <script src="/static/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="/static/js/site.js" type="text/javascript"></script>
    {% endblock %}
    {% block pagescript %}
      <script type="text/javascript" charset="utf-8">
      </script>
    {% endblock %}
    {% include "languages.tpl" %}
</html>
