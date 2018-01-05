$(document).ready(function(){
  var table = $('#certificate_lists').DataTable({
    paging: true,
    autoWidth: false,
    responsive: true,
    aaSorting: [],
    lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
    pageLength: -1,
    language: {
      sSearch: "Search :",
      searchPlaceholder: "Filter Keyword",
    },
    columns: [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      { "orderable": false},
      { "orderable": false}
    ]
  });
});
