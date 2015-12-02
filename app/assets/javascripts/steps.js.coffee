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

  $('#chronometer-btn').on 'click' , ->
  	if $('#countdown').length
      $('#countdown').countdown('destroy')
      $('#chronometer-section').empty()
    else
   	  $('#chronometer-section').append '<div id="countdown"> </div><button id="startButton", class="btn btn-default">Start</button><button id="pauseButton", class="btn btn-default">Pause</button>'

      liftoffTime = new Date
      liftoffTime.setHours 0, 0, 0, 0
      liftOff = ->
        alert 'Timer has expired!'
        return
      $('#countdown').countdown
        until: liftoffTime
        onExpiry: liftOff
      $('#startButton').click ->
        liftoffTime = new Date
        liftoffTime.setMinutes liftoffTime.getMinutes() + 5
        $(this).text 'Restart'
        $('#countdown').countdown 'option', until: liftoffTime
        return
      $('#pauseButton').click ->
        pause = $(this).text() == 'Pause'
        $(this).text if pause then 'Resume' else 'Pause'
        $('#countdown').countdown if pause then 'pause' else 'resume'
        return
    return
  
  return