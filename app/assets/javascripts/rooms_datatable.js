jQuery(document).ready(function() {
  $('#rooms-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#rooms-datatable').data('source')
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