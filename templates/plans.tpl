{% extends "base.tpl" %}
{% load i18n %}
{% block title %}{% trans "plans" %}{% endblock %}

{% block main %}
<link rel="stylesheet" href="/static/css/base1.css" type="text/css" media="screen" />
<link rel="shortcut icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg">
<link rel="icon" href="http://i50.tinypic.com/25su7go.jpg" type="image/jpeg">
<style>
body {
direction:rtl;
font-family:Arial;
}
div.wrap {
margin:auto;
width:960px;
height:850px;
background-color:white;
background-image:url(http://i48.tinypic.com/24ossus.jpg); 
background-repeat:repeat-x;
}
img {
padding:0px;
margin:0px;
border:0px;
}

.greenbox {
background-image:url(http://i48.tinypic.com/2gtt4j5.jpg);
background-position:center top;
padding-top:40px;
color:white;
width:230px;
height:260px;
background-repeat:no-repeat;
text-align:center;
font-weight:bold;
}
.b1 {
position:absolute;
right:16%;
}
.b2 {
position:absolute;
right:39%;
}
.b3 {
position:absolute;
right:62%;
}
#costtop,#minutestop,#smstop {
height:120px;
font-size:25px;
}
input.page2 {
width:40px;
margin-right:10px;
border:1px solid black;
position:absolute;
right:140px;
}
.bluebar {
background-image:url(http://i45.tinypic.com/15yzwp3.jpg);
background-position:center top;
background-repeat:no-repeat;
margin:auto;
color:white;
font-weight:bold;
font-size:50px;
padding-top:15px;
text-align:center;
position:absolute;
right:10%;
top:550px;
height:115px;
width:790px;
}
.clock {
position:absolute;
left:100px;
top:125px;
}
.header {
margin-bottom:20px;
}
#progress, #ticks {
        width: 70px;
        height: 200px;
margin-bottom:20px;
        border: 1px solid #666;
        background-color:#CE3918;
margin-right:115px;
      }
      
      #ticks {
        margin: 1em auto;
        height: 20px;
      }
      
#progress-inner {
        height: 100%;
        display: none;
        background-color:white;

      } 
.title {
color:white;
font-weight:bold;
font-size:30px;
margin-right:60%;
display:none;
}
#send {
border-width:0px;
width:64px;
height:49px;
}
.largefont {
    font-size:large;
}
.th {
background-image:none;

}
.th td {
font-weight:bold;
}
table {
text-align:center;
}
tr.packages {
background-image:url(http://i49.tinypic.com/ir3rcy.jpg);
background-repeat:repeat-x;
background-position:center bottom;
}
td {
padding-bottom:15px;
}
table {
border-spacing:0px;
}


table {
text-align:center;
}
caption {
color:white;
font-weight:bold;
font-size:30px;
}
</style>
{% include "popup.tpl" %}
{% load i18n %}

<div class="wrap">
    <div class="header"><a href="{% url home_page %}"><img src="http://i46.tinypic.com/2cqfrjr.jpg" alt="????? ???"></a></div>

    <div style="padding:0px 20px 0px 20px;">

        <div style="right:300px;top:0px;width:600px;float:left">
            <table style="width:100%;">
                <tr class="th">
                    <td colspan=4>
                        <h2>
                            {% if saved %}
                                {% trans "you can save up to " %}{{ saved|floatformat:"-2" }}{% trans " shekels every month!" %}
                            {% else %}
                                {% trans "you already have a great deal!" %}
                            {% endif %}
                        </h2>
                    </td>
                </tr>
                <tr class="th ">
                    <td>{% trans "cost per month" %}</td>
                    <td>{% trans "annual cost" %}</td>
                    <td>{% trans "plan name" %}</td>
                    <td>{% trans "operator" %}</td>
                </tr>
                {% for plan in plans %} 
                <tr class="packages largefont">
                    <td> {{ plan.0|floatformat:"-2" }} </td>
                    <td> {{ plan.1|floatformat:"-2" }} </td> 
                    <td> {{ plan.2 }} </td>
                    <td> <a href="http://tinypic.com" target="_blank">
                        <img width="32" height="32" src="http://i48.tinypic.com/{{ plan.4 }}" border="0" alt="Image and video hosting by TinyPic"></a> 
                    </td>
                    <td><a href="#"  onclick="$('#popup').val('{{plan.2.id}}').fadeIn();">
                        <img src="http://i48.tinypic.com/2nu3aed.jpg" style="margin-right:10px" alt="????? ?????" /></a>
                    </td>
                </tr>
                {% endfor %} 
            </table>
        </div>


        <div style="background-image:url(http://i48.tinypic.com/2q812tx.jpg);background-repeat:no-repeat;background-position:right top;padding-top:70px;height:525px">
            <div style="position:absolute;right:40px;color:white;font-weight:bold" {% if not LANGUAGE_BIDI %}style="font-size: smaller;" dir="ltr"{% endif %}>
                {% trans "sucker" %}
                <br /><br /><br/>
                {% trans "paying a lot" %}
                <br /><br/><br/>
                {% trans "average" %}
                <br /><br /><br />
                {% trans "good deal!" %}
            </div>

            <div id="progress" style="margin-left: 5em;">
                <div id="progress-inner">
                </div>
            </div>

            <div style="margin-top:50px;position:absolute;right:-100px;display:inline">
                <form method="get" action="" style="width:200px;position:absolute;right:100px">
                <label for="imoney"{% if not LANGUAGE_BIDI %}style="font-size: smaller; text-align: left;" dir="ltr"{% endif %}> {% trans "shekels/mo." %} </label>
                <input class="page2" type="text" name="price" id="cost" /><br /><br /> 
                <label for="iminutes"{% if not LANGUAGE_BIDI %}style="font-size: smaller; text-align: left;" dir="ltr"{% endif %}> {% trans "minutes/mo." %} </label>
                <input class="page2" type="text" name="minutes" id="minutes" />
                <br /><br />
                <label for="isms"{% if not LANGUAGE_BIDI %}style="font-size: smaller; text-align: left;" dir="ltr"{% endif %}> {% trans "texts/mo." %} </label>
                <input class="page2" type="text" name="sms" id="sms" />
                <br /><br />
                <input type="image" name="send" id="send" src="http://i46.tinypic.com/2zegn7b.jpg" />
            </div>
        </div>
    </div>
</div>

<div style="margin:auto;width:100px;">
    <a href="http://twitter.com/?status={% trans 'I just saved ' %}{{saved|floatformat:"-2"}}{% trans ' shekels using ' %}%23frayermeter">
        <img src="http://i46.tinypic.com/10ol4qd.jpg" alt="twitter" />
    </a> 
</div>

{% endblock %}

{% block headme %}
<script type="text/javascript" src="http://trentrichardson.com/Impromptu/scripts/jquery-impromptu.2.7.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8">
    $( function(){
      setTimeout("$('#progress-inner').fadeIn(200);", 100);
      setTimeout("$('#progress-inner').animate({ height: '{{frayer}}%' }, 3000, 'swing')", 500);
    });
</script>
{% endblock %}
