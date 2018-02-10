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
      $('#certificate_degree_name').append($('<option value="" selected>Select any Degree</option>'));
      $.each(degree_names, function( index, value ) {
        $('#certificate_degree_name').append($('<option>'+ value +'</option>'));
      });
      $('#certificate_college_name').append($('<option value="" selected>Select any College</option>'));
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
      $('#certificate_college_name').append($('<option value="" selected>Select any College</option>'));
      $.each(result, function( index, value ) {
        $('#certificate_college_name').append($('<option>'+ value +'</option>'));
      });
    }
  });
}

function get_certificates_data_through_ajax_cal(arr) {
  $.ajax({
    type: "get",
    contentType: "application/json; charset=utf-8",
    url: "/certificates/get_certificates_data",
    data: {data_value: arr},
    success: function(result){
      console.log("ajax call successfully completed");
      list_table.clear().draw();
      list_table.destroy();
      $('#certificate_lists tbody').append(result.certificates);
      useDatatables();
    }
  }); // End of ajax call
}
function useDatatables() {
  list_table = $('#certificate_lists').DataTable({
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
      { "orderable": false},
      { "orderable": false}
    ]
  });
}
