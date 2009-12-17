{% load i18n %}
<div id="language-links">
  {% for lang in LANGUAGES %}
    <a href="{% url set_lang_url lang.0 %}" class="tiny">{{ lang.1|lower }}</a>
  {% endfor %}
</div>

