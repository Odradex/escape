jQuery(document).ready(function() {
  $('#services_datatable').DataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $("#services-datatable").data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      { "data": "name" },
      { "data": "price" },
      { "data": "options", "orderable": false, "searchable": false }
    ]
  });
});