{% extends "base.tpl" %}
{% load i18n %}
{% block main %}
<style type="text/css">
  #info {
    margin: 5em auto;
    width: 70%;
    border: 1px solid #bfbfbf;
    text-align: center;
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
        <td class="thename">Boris Dinkevich</td>
        <td class="tiny">backend ninja</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Nissim Bar-Siman-Tov</td>
        <td class="tiny">market research</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Oren Yomtov</td>
        <td class="tiny">HTML/JS master</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Ran Erlich</td>
        <td class="tiny">the man with the plan</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Romi Shamai</td>
        <td class="tiny">ui/user experience</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Shai Davis</td>
        <td class="tiny">graphic design expert</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Shilo Ayalon</td>
        <td class="tiny">db and backend</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
      <tr>
        <td class="thename">Yifat Hadaya</td>
        <td class="tiny">marketing and branding</td>
        <td><a href="http://twitter.com/username">@username</a></td>
      </tr>
    </tbody>
  </table>
</div>
{% endblock %}
