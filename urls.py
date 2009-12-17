from django.conf.urls.defaults import *
from django.views.static import serve
from settings import DOC_ROOT
import os

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # site root url
    (r'^home/$', 'swi09.theapp.views.home_page', {}, 'home_page'),
    
    # under contstruction
    (r'^$', 'swi09.theapp.views.home_page', {}, 'home_page'),
    
    # Ajax grapths
    (r'^graphs$', 'swi09.theapp.views.graphs', {}, 'home_page'),
    
    # Ajax grapths
    (r'^plans/$', 'swi09.theapp.views.plans', {}, 'home_page'),
    
    # site media
    (r'^static/(.*)$',  serve, { 'document_root': os.path.join(DOC_ROOT,'media/') }),
    
    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    
    # internationalization support - setting the language    
    (r'^i18n/', include('django.conf.urls.i18n')),
    
    # set a language
    (r'^set_languauge/(?P<lang_code>\w+)/$', 'swi09.theapp.views.set_language', {}, 'set_lang_url'),
)
