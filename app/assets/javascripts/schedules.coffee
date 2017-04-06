$ ->
  $('#calendar-schedule').fullCalendar(
    defaultView: 'month'
    header:
      left: 'title',
      center: '',
      right: 'prev,next today month,agendaWeek'
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    eventColor: '#46BF9E'
    events: '/schedules/get_events.json'
    editable: true
    eventRender: (event, element) ->
      element.qtip(
        content:
          text: event.tooltip
          title:
            text: '出ろよ'
            button: true
        show:
          solo: true
        hide: false
        style:
          classes: 'qtip-jtools qtip-rounded'
      )
  )
