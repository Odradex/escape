jQuery(document).ready(function() {
  $('#reservations-datatable').dataTable({
    "language": {
      url: '//cdn.datatables.net/plug-ins/1.11.5/i18n/ru.json'
    },
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