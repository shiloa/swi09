{% extends "base.tpl" %}
{% load i18n %}
{% block main %}
<style type="text/css">
  #info {
    margin: 5em auto;
    width: 70%;
    border: 1px solid #bfbfbf;
    text-align: center;
    padding:10px;
  }

  #title {
    font-size: larger;
  }  
    
  table {
    margin: 1em auto;
    width: 60%;
  }
  
  table td {
    text-align: left;
  }
  .thename {
    font-weight: bolder;
    font-family: monospace,serif, verdana;
  }
  .tiny {
    font-size: smaller;
  }
</style>
<div id="info" dir="ltr">
  <span id="title">this site is a joint venture of several <a href="http://israel.startupweekend.org/">startupweekend</a> participants:</span>
  <table dir="ltr">
    <tbody>
      <tr>
        <td class="thename"><a href="mailto:boris@dinkevich.com">Boris Dinkevich</a></td>
        <td class="tiny">backend ninja</td>
        <td><a href="http://twitter.com/BorisDinkevich">@BorisDinkevich</a></td>
      </tr>
      <tr>
        <td class="thename">Nissim Bar-Siman-Tov</td>
        <td class="tiny">product development</td>
        <td><!--<a href="http://twitter.com/username">@username</a>--></td>
      </tr>
      <tr>
        <td class="thename"><a href="mailto:thenameisoren@gmail.com">Oren Yomtov</a></td>
        <td class="tiny">frontend ninja</td>
        <td><a href="http://twitter.com/orenyomtov">@orenyomtov</a></td>
      </tr>
      <tr>
        <td class="thename"><a href="mailto:ranerlich@gmail.com">Ran Erlich</a></td>
        <td class="tiny">the man with the plan</td>
        <td><!--<a href="http://twitter.com/username">@username</a>--></td>
      </tr>
      <tr>
        <td class="thename"><a href="mailto:romi@baabua.co.il">Romi Shamai</a></td>
        <td class="tiny">ui/user experience</td>
        <td><a href="http://twitter.com/romish">@romish</a></td>
      </tr>
      <tr>
        <td class="thename"><a href="mailto:shaidavis@gmail.com">Shai Davis</a></td>
        <td class="tiny">graphic design expert</td>
        <td><!--<a href="http://twitter.com/username">@username</a>--></td>
      </tr>
      <tr>
        <td class="thename">Shilo Ayalon</td>
        <td class="tiny">db and backend</td>
        <td><a href="http://twitter.com/shiloa">@shiloa</a></td>
      </tr>
      <tr>
        <td class="thename"><a href="mailto:yifat.hadaya@gmail.com">Yifat Hadaya</a></td>
        <td class="tiny">marketing and branding</td>
        <td><!--<a href="http://twitter.com/username">@username</a>--></td>
      </tr>
    </tbody>
  </table>
<br/> 
<a href="{% url home_page %}">Back home</a>
<br/>
</div>
{% endblock %}
