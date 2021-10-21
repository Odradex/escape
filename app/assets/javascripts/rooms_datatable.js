jQuery(document).ready(function() {
  $('#roomsTable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#roomsTable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "organization"},
      {"data": "number"},
      {"data": "size"},
      {"data": "capacity"},
      {"data": "hourly_payment"},
      {"data": "options", "orderable": false}
    ]
  });
});