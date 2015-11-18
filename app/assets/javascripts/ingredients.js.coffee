# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#ingredientsinput").keyup ->
    tempValue = $(this).val()
    $.ajax
      url: '/ingredient'
      type: 'get'
      data: search: tempValue
    console.log gon.recing
    return