from django.shortcuts import render_to_response, HttpResponse, HttpResponseRedirect, Http404
from django.template import RequestContext
from django.utils.translation import check_for_language
from pdb import set_trace as debugger
from swi09.theapp.forms import UserInfoForm
from swi09.theapp.models import *
from decimal import Decimal
import datetime

def plans(request):

    if request.method != 'GET':
        raise Http404

    minutes = request.GET.get('minutes', 'bad')
    sms = request.GET.get('sms', 'bad')
    price = request.GET.get('price', 'bad')

    try:
        minutes = int(minutes)
        sms = int(sms)
        price = int(price)
    except ValueError:
        raise Http404

    plans = best_plans(sms, minutes, price)
    saved = price - plans[0][0]
    if saved < 0:
        saved = 0

    frayer = saved if saved < 95 else 95
    frayer = 95 - frayer 

    return render_to_response('plans.tpl', {'plans':plans, 'price':price, 'saved':saved, 'frayer':frayer, 'locals':locals() }, context_instance=RequestContext(request))


def best_plans(sms, minutes, price):
    themap = ("audnvn.jpg", "b66oab.gif", "audnvn.jpg", "audnvn.jpg", "1zvtpj4.gif", "1zvtpj4.gif")
    results = []
    for plan in Plan.objects.filter(is_active=True):
        plan_price = plan.my_price(sms, minutes)
        img = themap[plan.company.id]
        saved = price - plan_price if price > plan_price else 0
        results.append((plan_price, saved * 12, plan, saved, img))

    return sorted(results) [0:4]

def save_req(request):

    if not request.method == 'POST':
        raise Http404

    try:
        phone   = int(request.POST.get("phone", "fail"))
        sms     = int(request.POST.get("sms", "fail"))
        minutes = int(request.POST.get("minutes", "fail"))
        cost    = int(request.POST.get("cost", "fail"))
    except ValueError:
        raise Http404

    ContactRequest(phone=phone, minutes=minutes, sms=sms, cost=cost, date=datetime.datetime.now(), state=0).save()

    return HttpResponse("Done")

STEPS = 5
def graphs(request):
    if not request.method == 'GET':
        raise Http404
 
    # Get the requested column info
    column_map = { "cost" : (0, 2000), "minutes": (0, 60 * 10), "sms": (0, 500) }  
    req = request.GET.get("type", "")
    meta = column_map.get(req, "")
    if not meta:
        raise Http404

    # Get the user's value so we can find the matching bar
    user = request.GET.get("user", 'fail')
    try:
        user = int(user)
    except ValueError:
        raise Http404

    rstart, rend = meta
    
    step = (rend-rstart)/STEPS

    result = ""

    user_column = 0

    for i in range(0, STEPS):
        lstart = rstart + step * i
        lend = rstart + step * (i + 1) if i + 1 < STEPS else 5000

        if user in range(lstart, lend):
            user_column = i

        if req == "cost":
            count = len(UserInfo.objects.filter(cost__gte=lstart, cost__lt=lend))
        if req == "sms":
            count = len(UserInfo.objects.filter(sms__gte=lstart, sms__lt=lend))
        if req == "minutes":
            count = len(UserInfo.objects.filter(minutes__gte=lstart, minutes__lt=lend))

        result += "%d," % count

    result = result[:-1] + ":%d" % user_column
    
    return HttpResponse(result)


def showme(request):
    do = ""
    for x in Plan.objects.all():
        if not x.step_set.filter(classification=Step.STEP_TYPES[0]):
            Step(classification=Step.STEP_TYPES[0], unit_cost=Decimal("0.4"), plan=x, starts_at=x.base_sms, ends_at=99999).save()
        if not x.step_set.filter(classification=Step.STEP_TYPES[1]):
            Step(classification=Step.STEP_TYPES[1], unit_cost=Decimal("0.5"), plan=x, starts_at=x.base_minutes, ends_at=99999).save()
    return HttpResponse(do)

def home_page(request):
    """renders the home page of the site"""
    force_language(request, 'he')
    if request.method == 'POST':
        form = UserInfoForm(request.POST)
        if form.is_valid():
            form.save()
            cost = form.cleaned_data['cost']
            sms = form.cleaned_data['sms']
            minutes = form.cleaned_data['minutes']
            get_string = "?sms=%s&minutes=%s&price=%s" % (sms, minutes, cost)
            return HttpResponseRedirect("/plans%s" % get_string)
    else:
        form = UserInfoForm()

    return render_to_response('home.tpl', { 'form' : form }, context_instance=RequestContext(request))


def under_construction(request):
    """the classic 'site is under construction' page"""
    return render_to_response('construction.tpl', context_instance=RequestContext(request))


def force_language(request, lang_code):
    """force language code into session"""
    if hasattr(request, 'session'):
        if check_for_language(lang_code):
            request.session['django_language'] = lang_code


def set_language(request, lang_code='en'):
    """sets the application's language and redirects back to the calling template"""
    original_url = request.META.get('HTTP_REFERER', None)
    response = HttpResponseRedirect(original_url)
    
    if hasattr(request, 'session'):
        if lang_code and check_for_language(lang_code):
            request.session['django_language'] = lang_code
        else:
            response.set_cookie(settings.LANGUAGE_COOKIE_NAME, lang_code)

    return response

