$ ->
  $('#calendar').fullCalendar(
    defaultView: 'timelineMonth'
    events: '/reservations/get_events.json'
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    height: 600
  )
