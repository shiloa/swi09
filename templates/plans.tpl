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
min-height:800px;
position:relative;
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
        width: 100px;
        height: 200px;
margin-bottom:20px;
        border: 1px solid #666;
        background-color:#CE3918;
margin-right:73px;
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

.th {background-image:none;}
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
padding-bottom:10px;
}
table {
cell-spacing:0px;
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
</head>
<body>
{% include "popup.tpl" %}
<div class="wrap">
<div class="header"><a href=""><img src="http://i46.tinypic.com/2cqfrjr.jpg" alt="????? ???"></a></div>

<div style="padding:20px;">
<div style="background-image:url(http://i48.tinypic.com/2q812tx.jpg);background-repeat:no-repeat;background-position:right top;padding-top:70px;height:525px">
    <div style="position:absolute;right:40px;color:white;font-weight:bold">??????

    <br /><br />

    ????<br />????

    <br /><br /><br />

    ?????

    <br /><br /><br />

    ??? ???

    </div>

<div id="progress">

  <div id="progress-inner"></div>
</div>
<div style="margin-top:50px;position:absolute;right:-100px"><form method="get" action="" style="width:200px;position:absolute;right:100px">
<label for="imoney">????? ?????:</label><input class="page2" type="text" name="cost" id="cost"><br /><br />
<label for="iminutes">???? ?????:</label><input class="page2" type="text" name="minutes" id="minutes"><br /><br />
<label for="isms">????? ?????:</label><input class="page2" type="text" name="sms" id="sms"><br /><br />
<input type="image" name="send" id="send" src="http://i46.tinypic.com/2zegn7b.jpg">
</div>
</div>
<div style="position:absolute;right:300px;top:230px;width:600px">
<table style="width:100%;">
<tr class="th">
<td colspan=4>
<h2>
{% if saved %}
you can save {{ saved }} shek every month!
{% else %}
You already have a great deal
{% endif %}
</h2>
</td>
</tr>

<tr class="th">
<td>{% trans "cost per month" %}</td>
<td>{% trans "annual cost" %}</td>
<td>{% trans "plan name" %}</td>
</tr>
{% for plan in plans %} 
<tr class="packages">
<td> {{ plan.0 }} </td>
<td> {{ plan.1 }} </td> 
<td> {{ plan.2 }} </td>
<td> <a href="http://tinypic.com" target="_blank"><img width="32" height="32" src="http://i48.tinypic.com/{{ plan.4 }}" border="0" alt="Image and video hosting by TinyPic"></a> </td>
<td><a href="#"  onclick="$('#popup').fadeIn();"><img src="http://i49.tinypic.com/wtdl3m.jpg" alt="????? ?????" /></a></td>
</tr>
{% endfor %} 
</table>

</div>
</div>
</div>



{% endblock %}

{% block headme %}
<script type="text/javascript" src="http://trentrichardson.com/Impromptu/scripts/jquery-impromptu.2.7.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8">
    $( function(){
      setTimeout("$('#progress-inner').animate({ height: '{{frayer}}%' }, 3000, 'swing')", 500);
    });
  </script>
{% endblock %}
