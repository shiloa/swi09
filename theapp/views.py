from django.shortcuts import render_to_response, HttpResponse, HttpResponseRedirect, Http404
from django.template import RequestContext
from django.utils.translation import check_for_language
from pdb import set_trace as debugger


def home_page(request):
    """renders the home page of the site"""
    return render_to_response('pages/home.tpl', context_instance=RequestContext(request))

def under_construction(request):
    """the classic 'site is under construction' page"""
    return render_to_response('construction.tpl', context_instance=RequestContext(request))

def set_language(request, lang_code='en'):
    """sets the application's language and redirects back to the calling template"""
    original_url = request.META.get('HTTP_REFERER', None)
    response = HttpResponseRedirect(original_url)
    
    if hasattr(request, 'session'):
        if lang_code and check_for_language(lang_code):
            request.session['django_language'] = lang_code
        else:
            response.set_cookie(settings.LANGUAGE_COOKIE_NAME, lang_code)

    return response# Create your views here.
