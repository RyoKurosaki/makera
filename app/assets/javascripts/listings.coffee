$ ->
  $('#activestart').datetimepicker
    format: 'hh:mm A'
    stepping: 30
    ignoreReadonly: true
    defaultDate: moment({ h: 20 })
  $('#activeend').datetimepicker
    format: 'hh:mm A'
    stepping: 30
    ignoreReadonly: true
    defaultDate: moment({ h: 8 })
  $('#area').slider(
    id: 'handle'
    step: 1
    min: 10
    max: 110
    tooltip: 'hide'
  )
  $('#area').on('slide', (slideEvt) ->
    $('#squareVal').text(slideEvt.value)
  )
