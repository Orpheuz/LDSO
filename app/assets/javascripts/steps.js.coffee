# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


stepN = 1
$(document).ready ->
  $('.next-step').on "click" , ->
    if document.getElementById('done-'+event.target.id) == null
      span = document.createElement('span')
      span.setAttribute 'class', 'glyphicon glyphicon-ok'
      span.setAttribute 'style', 'float:right'
      span.setAttribute 'id', 'done-'+event.target.id
      element = document.getElementById('header-' + event.target.id)
      element.appendChild span
    return