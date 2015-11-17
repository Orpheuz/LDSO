# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $(".search-choice").on "click",(event) ->
    oldVal = $('#search-choice-btn').html()
    val =  $('#' + event.target.id).html()
    $('#search-choice-btn').html val
    $('#' + event.target.id).html oldVal
    $('#SCN').attr 'value', val