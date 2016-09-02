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
