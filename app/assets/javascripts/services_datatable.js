jQuery(document).ready(function() {
  $('#services-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $("#services-datatable").data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      { "data": "category" },
      { "data": "name" },
      { "data": "price" }
    ]
  });
});