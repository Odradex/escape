jQuery(document).ready(function() {
  $('#reservations-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#reservations-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "user"},
      {"data": "start_time"},
      {"data": "end_time"}, 
      {"data": "options", "orderable": false},
    ]
  });
});