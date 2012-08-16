$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "mm/dd/yy"
      altField: $(this).next()
      firstDay: 1
      
$ ->
  $(".datepicker_for_query").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "dd/mm/yy"
      altField: $(this).next()
      firstDay: 1
