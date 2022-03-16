jQuery(document).ready(function() {
  $('#organizations-datatable').dataTable({
    "language": {
      url: '//cdn.datatables.net/plug-ins/1.11.5/i18n/ru.json'
    },
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#organizations-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "name"},
      {"data": "owner"},
      {"data": "adress"},
      {"data": "opening_time"},
      {"data": "closing_time"},
      {"data": "options", "orderable": false},
    ]
  });
});