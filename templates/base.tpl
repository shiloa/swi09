<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> -->
{% load i18n %}
<html {% if LANGUAGE_BIDI %}dir="rtl"{% endif %} lang="{{ LANGUAGE_CODE }}">
    <head>
        {% include "meta.tpl" %}
        <title>{% block title %}{% trans "Home" %}{% endblock %} &curren; {% trans "Some Site" %}</title>
        <link rel="stylesheet" href="/static/css/base.css" type="text/css" media="screen" title="no title"
        <link rel="shortcut icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg">
        <link rel="icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg"> charset="utf-8"></link>
    </head>
    <body id="index">
            {% include "languages.tpl" %}
            {# {% include "nav.tpl" %} #}
            {% block main %}{% endblock %}
        {% block footer %}
          <div id="footer"></div>
        {% endblock %}
    </body>
    {% block javascript %}
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
        {# <script src="/static/js/jquery.min.js" type="text/javascript"></script> #}
        <script src="/static/js/jquery.ui.min.js" type="text/javascript"></script>
        <script src="/static/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="/static/js/site.js" type="text/javascript"></script>
    {% endblock %}
    {% block pagescript %}
      <script type="text/javascript" charset="utf-8">
      </script>
    {% endblock %}
</html>
