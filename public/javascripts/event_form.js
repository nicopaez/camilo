$(document).ready(function() {
  $('#event_date').datepicker( { format: 'yyyy-mm-dd'} );
  $('#event_date_button').click( function() {
  	$('#event_date').datepicker("show");
  });
});

