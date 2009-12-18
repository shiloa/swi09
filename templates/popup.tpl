<style type="text/css" media="screen">
  #popup {
    width: 300px;
    height: 200px;
    position: absolute;
    border: 4px solid #bfbfbf;
    top: 10%;
    left: 35%;
    background-color: white;
    -moz-border-radius: 3px;
    z-index: 100;
    text-align: center;
  }
  
  #popup table {
    margin: 2em auto 0 auto;
  }
  
  #thanks {
    padding: 4em;
    vertical-align: center;
  }
  
  #thanks-text {
    font-size: 20pt;
    color: #2FDC44;
    display: block;
    margin-bottom: 1em;
  }
  
  .link-button {
    padding: 5px 10px;
    border: 2px solid #bfbfbf;
    -moz-border-radius: 2px;
    text-decoration: none;
    background-color: white;
  }
  
  .link-button:hover {
    background-color: #A6E49F;
  }
  
  #disclaimer {
    font-size: 8pt;
    color: #bfbfbf;
    margin-top: 3em;
  }
</style>
<script src="/static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
  $(function() {
    $('#phone').val('');
    $('#send').click(function(){
      $('#send-table').fadeOut(1000);
      $('#disclaimer').fadeOut(1000);
      $(this).fadeOut(1000);
      setTimeout("$('#thanks').fadeIn();", 1000);
    });
    
    $('#close').click(function (){
      $('#popup').hide();
    });
  });
</script>
{% load i18n %}
<div id="popup"  style="display: none;">
  <table id="send-table" border="0" cellspacing="5" cellpadding="5">
    <tr>
      <th>{% trans "your phone number:" %}</th>
    </tr>
    <tr>
      <td>
        <input type="text" name="phone" value="" id="phone" />
      </td>
    </tr>
  </table>
  <a href="#" id="send" class="link-button">{% trans "send" %}</a>    
  <div id="disclaimer">
    {% trans "(we will <b>NEVER</b> abuse your number)" %}
  </div>   
  <div id="thanks" style="display: none;">
    <span id="thanks-text">{% trans "thanks!" %}</span>
    <a href="#" id="close" class="link-button">{% trans "close" %}</a>    
 
  </div>

</div>