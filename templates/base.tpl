<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

{% load i18n %}
<html {% if LANGUAGE_BIDI %}dir="rtl"{% endif %} lang="{{ LANGUAGE_CODE }}">
<head>
{% include "meta.tpl" %}
<title>{% block title %}{% trans "Home" %}{% endblock %} &curren; {% trans "FrayerMeter" %}</title>

<link rel="shortcut icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg">

<link rel="icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg"></link>

<link rel="stylesheet" href="/static/css/base1.css" type="text/css" media="screen" />

{% block headme %}
{% endblock %}
</head>

<body>
{% block main %}{% endblock %}

{% block footer %} <div id="footer"></div> {% endblock %}

{% include "languages.tpl" %}

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
try {
    var pageTracker = _gat._getTracker("UA-10967567-5");
    pageTracker._trackPageview();
} catch(err) {}
</script>

</body>

{% block javascript %}
<script src="/static/js/jquery.min.js" type="text/javascript"></script>
<script src="/static/js/jquery.ui.min.js" type="text/javascript"></script>
<script src="/static/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/static/js/site.js" type="text/javascript"></script>
{% endblock %}

{% block pagescript %}
<script type="text/javascript" charset="utf-8">
</script>
{% endblock %}

</html>
