$(document).ready(function() {
  $('.date input').datepicker({
    format: "dd.mm.yyyy",
    weekStart: 1,
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
  });

  $('#employees').on('click', 'tbody tr', function(e) {
    e.preventDefault();
    window.location = e.currentTarget.dataset.href;
  });

  $('.staffing-link').on('click', function(e) {
    $('#staffing-frame-holder').toggleClass('hidden');
  });

  var employeeTable = document.getElementById('employee-table');
  if (employeeTable) {
    new Tablesort(employeeTable);
  }
});
