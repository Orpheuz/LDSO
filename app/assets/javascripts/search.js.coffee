# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ingN = 2

$(document).ready ->
  $(".search-choice").on "click",(event) ->
    oldVal = $('#search-choice-btn').html()
    val =  $('#' + event.target.id).html()
    $('#search-choice-btn').html val
    $('#' + event.target.id).html oldVal
    $('#SCN').attr 'value', val
  $("#add-ingredient").on "click",(event) ->
    this.remove
    $(".all-ing").append '<input name="searchIng[]" class="form-control" id="searchIng' + ingN + '" />'
    ingN++