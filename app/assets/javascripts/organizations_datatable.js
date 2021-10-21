jQuery(document).ready(function() {
  $('#organizations-datatable').dataTable({
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