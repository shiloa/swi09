<html>
<head>
<title>פראיר מטר</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
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
background-color:#CE3918;
background-image:url(http://i49.tinypic.com/2crabf8.jpg);
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
#moneytop,#minutestop,#smstop {
height:120px;
font-size:25px;
}
input {
width:40px;
margin-right:10px;
border:1px solid black;
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
margin-bottom:150px;
}
</style>
<script>
var sms=
function kup(d,id) {
  if (d.value.length>0) {
    document.getElementById(id).innerHTML=getGraph(d, d.value);
  } else {
   document.getElementById(id).innerHTML=getQuestion(id);
  }
}

function getQuestion(id) {
return 'שאלה';
}

function getGraph(id,value) {
  return 'INSERT GRAPH HERE';
}
</script>
</head>
<body>
<div class="wrap">
<div class="header"><a href=""><img src="http://i48.tinypic.com/24zvp4w.jpg" alt="פראיר מטר"></a></div>
<img src="http://i47.tinypic.com/zji03n.jpg" class="clock" alt="clock">
<div class="greenbox b1">
<div id="moneytop">מהו גובה התשלום<br />החודשי שלך?</div>
<div class="bottom"><label for="imoney">תשלום חודשי:</label><input type="text" class="walla" name="money" id="imoney" onkeyup="kup(this,'moneytop');"></div>
</div>

<div class="greenbox b2">
<div id="minutestop">כמה דקות את/ה<br />מדבר/ת בחודש?</div>
<div class="bottom"><label for="iminutes">דקות לחודש:</label><input type="text" name="minutes" id="iminutes" onkeyup="kup(this,'minutestop')"></div>
</div>

<div class="greenbox b3">
<div id="smstop">כמה סמסים את/ה<br />שולח/ת בחודש?</div>
<div class="bottom"><label for="isms">סמסים לחודש:</label><input type="text" name="sms" id="isms" onkeyup="kup(this,'smstop')"></div>
</div>

<div class="bluebar">אל תהיה פראיר - בדוק וחסוך!</div>

</div>
</body>
</html>
