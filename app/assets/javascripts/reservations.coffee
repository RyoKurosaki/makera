$ ->
  $('#calendar').fullCalendar(
    defaultView: 'timelineMonth'
    views: { timelineMonth: { slotDuration: '12:00' } }
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    height: 600
    resourceAreaWidth: '20%'
    resourceColumns: [
      { group: true, labelText: 'Host', field: 'host' },
      { labelText: 'Listing', field: 'listing' }
    ]
    resources: '/reservations/get_resources.json'
    events: '/reservations/get_events.json'
  )
