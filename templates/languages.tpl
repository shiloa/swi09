{% load i18n %}
<!--
<form action="/i18n/setlang/" id="language-form" method="post" {% if LANGUAGE_BIDI %}dir="rtl"{% endif %}>
  <select name="language">
    {% for lang in LANGUAGES %}
      <option value="{{ lang.0 }}">{{ lang.1 }}</option>
    {% endfor %}
  </select>
  <input type="submit" value="{% trans 'go' %}" />
</form>
-->
<div id="language-links">
  {% for lang in LANGUAGES %}
    <a href="{% url set_lang_url lang.0 %}" class="tiny">{{ lang.1|lower }}</a>
  {% endfor %}
</div>

