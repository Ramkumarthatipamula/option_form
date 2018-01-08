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

function retrieve_courses_and_colleges_based_on_academic_program(value) {
  $.ajax({
    url: "/certificates/retrieve_courses_and_colleges_based_on_academic_program",
    data: {academic_program: value},
    success: function(result){
      var degree_names = new Array();
      var college_names = new Array();
      for (var key in result) {
        degree_names.push(key);
        college_names.push(result[key]);
      }
      $('#certificate_college_name').find('option').remove();
      $('#certificate_degree_name').find('option').remove();
      $.each(degree_names, function( index, value ) {
        $('#certificate_degree_name').append($('<option>'+ value +'</option>'));
      });
      $.each(college_names[0], function( index, value ) {
        $('#certificate_college_name').append($('<option>'+ value +'</option>'));
      });
    }
  });
}

function retrieve_colleges_based_on_degree(value) {
  $.ajax({
    url: "/certificates/retrieve_colleges_based_on_degree",
    data: {degree_name: value},
    success: function(result){
      $('#certificate_college_name').find('option').remove();
      $.each(result, function( index, value ) {
        $('#certificate_college_name').append($('<option>'+ value +'</option>'));
      });
    }
  });
}
