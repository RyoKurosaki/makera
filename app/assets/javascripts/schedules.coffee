$ ->
  $('#calendar-schedule').fullCalendar(
    defaultView: 'month'
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    events: '/schedules/get_events.json'
    eventMouseover: (calEvent, jsEvent)->
      $('body').prepend(calEvent.tooltip)
      xOffset = 30 + $('#tooltip').height()
      yOffset = -20

      $('#tooltip').css('top', (jsEvent.clientY - xOffset) + 'px').css('left', (jsEvent.clientX + yOffset) + 'px').fadeIn()
    eventMouseout: (calEvent, jsEvent)->
      $('#tooltip').remove()
  )
