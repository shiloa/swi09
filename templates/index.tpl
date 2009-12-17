<html>
    <head>
	<link type="text/css" href="http://jqueryui.com/themes/base/ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="http://jqueryui.com/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="http://jqueryui.com/ui/ui.core.js"></script>
    <script type="text/javascript" src="http://jqueryui.com/ui/ui.slider.js"></script>
    <link type="text/css" href="../demos.css" rel="stylesheet" />
    <style type="text/css">
        div.demo { padding: 10px; width:500px; margin:auto; };
    </style>

    <script type="text/javascript">
        $(document).ready(function() {
                $(".slider-range-min").slider({ range: "min", value: 200, min: 20, max: 2000, slide: function(event, ui) {
                    $("#" + $(this).attr("id")).val(ui.value); 
                    }
                    });
                });
     </script>
 </head>
 <body>

     <div class="demo">

{% if form.errors %} <ul> {% for err in form.errors %} <li> {{ err }} </li> {% endfor %} </ul> {% endif %} 
<table>

<form action="" method="post">
Company:
{{ form.company.as_widget }}

<tr><th>
<label for="id_minutes"> Minutes per month </label>
<input type="text" class="slide_slave" id="id_minutes" name="minutes" style="border:0; color:#f6931f; font-weight:bold;" />
<div class="slider-range-min" id="id_minutes"></div>
</td></tr>

<tr><th>
<label for="id_sms"> SMS per month </label>
<input type="text" class="slide_slave"  id="id_sms" name="sms"style="border:0; color:#f6931f; font-weight:bold;" />
<div class="slider-range-min" id="id_sms"></div>
</td></tr>

<tr><th>
<label for="id_cost"> Cost per month </label>
<input type="text"  class="slide_slave" id="id_cost" name="cost" style="border:0; color:#f6931f; font-weight:bold;" />
<div class="slider-range-min" id="id_cost"></div>
</td></tr> 


<tr> <td>
<input type="submit" value="Find out !"/>
</td></tr>
</form>
</table>


</div>

</body>
</html>


