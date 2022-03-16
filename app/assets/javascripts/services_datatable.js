jQuery(document).ready(function() {
  $('#services-datatable').dataTable({
    "language": {
      url: '//cdn.datatables.net/plug-ins/1.11.5/i18n/ru.json'
    },
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