from django.conf.urls.defaults import *
from django.views.static import serve
from settings import DOC_ROOT
import os

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # site root url
    (r'^home/$', 'bilha.theapp.views.home_page', {}, 'home_page'),
    
    # under contstruction
    (r'^$', 'bilha.theapp.views.under_construction', {}, 'home_page'),
    
    # site media
    (r'^static/(.*)$',  serve, { 'document_root': os.path.join(DOC_ROOT,'media/') }),
    
    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    
    # internationalization support - setting the language    
    (r'^i18n/', include('django.conf.urls.i18n')),
    
    # set a language
    (r'^set_languauge/(?P<lang_code>\w+)/$', 'bilha.theapp.views.set_language', {}, 'set_lang_url'),
)
