$(document).ready(function() {
  $('.date input').datepicker({
    format: "dd.mm.yyyy",
    weekStart: 1,
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
  });

  $('#employees').on('click', 'table tr', function(e) {
    e.preventDefault();
    window.location = e.currentTarget.dataset.href;
  });
});
