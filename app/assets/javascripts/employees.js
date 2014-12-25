$(document).ready(function() {
  $('.date input').datepicker({
    format: "dd.mm.yyyy",
    weekStart: 1,
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
  });
});
