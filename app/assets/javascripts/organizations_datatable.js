jQuery(document).ready(function() {
  $('#organizationsTable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#organizationsTable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "name"},
      {"data": "owner"},
      {"data": "adress"},
      {"data": "opening_time"},
      {"data": "closing_time"},
      {"data": "options"},
    ]
  });
});