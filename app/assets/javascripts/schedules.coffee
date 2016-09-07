$ ->
  $('#calendar-schedule').fullCalendar(
    defaultView: 'month'
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    events: '/schedules/get_events.json'
    editable: true
    eventRender: (event, element) ->
      element.qtip(
        content:
          text: event.tooltip
          title:
            text: 'title'
        style:
          classes: 'qtip-blue qtip-rounded'
      )
  )
