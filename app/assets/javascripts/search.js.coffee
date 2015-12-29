# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ingN = 1
tagN = 1

$(document).ready ->
    $("#add-ingredient").on "click",(event) ->
        this.remove
        ingN++
        $(".all-ing").append '<input name="searchIng[]" class="form-control" id="searchIng' + ingN + '" />'
    $("#add-tag").on "click",(event) ->
      this.remove
      tagN++
      $(".all-tags").append '<input name="tags[]" class="form-control" id="searchTag' + tagN + '" />'

