jQuery(function($) {
    return $("input.datepicker").each(function(i) {
      return $(this).datepicker({
        altFormat: "yy-mm-dd",
        dateFormat: "mm/dd/yy",
        altField: $(this).next(),
        firstDay: 1
      });
    });
  });

jQuery(function($) {
    return $(".datepicker_for_query").each(function(i) {
      return $(this).datepicker({
        altFormat: "yy-mm-dd",
        dateFormat: "dd/mm/yy",
        altField: $(this).next(),
        firstDay: 1
      });
    });
  });
