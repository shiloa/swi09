{% load i18n %}
<div id="nav">
	<a href="{# url contact_page #}" class="nav-link">{% trans "Contact" %}</a>
	<div class="nav-sep"></div>
	<a href="{# url gallery_page #}" class="nav-link">{% trans "Gallery" %}</a>
	<div class="nav-sep" /></div>
	<a href="{# url about_page #}" class="nav-link">{% trans "About" %}</a>
	<div class="nav-sep" /></div>
	<a href="{% url home_page %}" class="nav-link">{% trans "Home" %}</a>
</div>
