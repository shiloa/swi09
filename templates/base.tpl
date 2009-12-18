<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> -->
{% load i18n %}
<html {% if LANGUAGE_BIDI %}dir="rtl"{% endif %} lang="{{ LANGUAGE_CODE }}">
    <head>
        {% include "meta.tpl" %}
        <title>{% block title %}{% trans "Home" %}{% endblock %} &curren; {% trans "Some Site" %}</title>
        <link rel="stylesheet" href="/static/css/base.css" type="text/css" media="screen" title="no title" charset="utf-8"></link>
        <link rel="stylesheet" href="/static/css/lightbox.css" type="text/css" media="screen" title="no title" charset="utf-8"></link>
    </head>
    <body id="index">
          <!--<div id="mask-top"></div>
          <div id="mask-bottom"></div>-->
          <div id="content">
              <div id="banner">
                <a href="{% url home_page %}" class="no-underline">
                  <img id="logo-text" border="0" src="/static/images/bilha-text.png" />
                  <img id="logo-image" border="0" src="/static/images/bilha-logo.png" />
                </a>
                {% include "languages.tpl" %}
              </div>
            {% block main %}{% endblock %}
        </div>
        {% block footer %}
        {# {% include "languages.tpl" %} #}
          <div id="footer"></div>
        {% endblock %}
    </body>
    {% block javascript %}
        <script src="/static/js/jquery.min.js" type="text/javascript"></script>
        <script src="/static/js/jquery.ui.min.js" type="text/javascript"></script>
        <script src="/static/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="/static/js/jquery.lightbox.js" type="text/javascript"></script>
        <script src="/static/js/site.js" type="text/javascript"></script>
    {% endblock %}
    {% block pagescript %}
      <script type="text/javascript" charset="utf-8">
      </script>
    {% endblock %}
</html>
