# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


stepN = 1
$(document).ready ->
  
  $('.panel').on 'hidden.bs.collapse', (e) ->
    Id = e.currentTarget.id.split('-')[1]
    $('#countdown-' + Id).countdown('destroy')
    $('#chronometerSection-'+Id).empty()
    return

  $('.next-step').on "click" , ->
    if document.getElementById('done-'+event.target.id) == null
      span = document.createElement('span')
      span.setAttribute 'class', 'glyphicon glyphicon-ok'
      span.setAttribute 'style', 'float:right'
      span.setAttribute 'id', 'done-'+event.target.id
      element = document.getElementById('header-' + event.target.id)
      element.appendChild span
    return

  $('[id^=chrBtn]').on 'click' , ->
  	if $('#countdown-' + @id.split('-')[1]).length
      stepId = @id.split('-')[1]
      $('#countdown-' + stepId).countdown('destroy')
      $('#chronometerSection-'+stepId).empty()
    else
      stepId = @id.split('-')[1]
   	  $('#chronometerSection-' + stepId).append '<div id="countdown-' + stepId + '"> </div><button id="startButton", class="btn btn-default">Start</button><button id="pauseButton", class="btn btn-default">Pause</button>'
      liftoffTime = new Date
      liftoffTime.setHours 0, 0, 0, 0
      liftOff = ->
        alert 'Timer has expired!'
        return
      $('#countdown-' + stepId).countdown
        until: liftoffTime
        onExpiry: liftOff
      $('#startButton').click ->
        liftoffTime = new Date
        liftoffTime.setMinutes liftoffTime.getMinutes() + gon.steptime[stepId-1].time
        $(this).text 'Restart'
        $('#countdown-' + stepId).countdown 'option', until: liftoffTime
        return
      $('#pauseButton').click ->
        pause = $(this).text() == 'Pause'
        $(this).text if pause then 'Resume' else 'Pause'
        $('#countdown-' + stepId).countdown if pause then 'pause' else 'resume'
        return
    return
  
  return