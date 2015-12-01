# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  liftoffTime = new Date

  liftOff = ->
    alert 'Timer has expired!'
    return

  liftoffTime.setHours 0, 0, 0, 0
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