function change_client() {
   $.get("get_building?id=" + $("#client").val(),
    function(list_buildings) {
    html = "<option value>--- Select One ---</option>";
    for (var i = 0; i < list_buildings.buildings.length; i++) {
      html =
        html +
        "<option value='" +
        list_buildings.buildings[i].id +
        "'>" +
        list_buildings.buildings[i].id + " city: " + list_buildings.address[i] +
        "</option>";
    }
    $("#select_building").html(html);
    change_building();
   }
  );
}


function change_building() {
  $.get("get_battery?id=" + $("#select_building").val(),
    function(list_batteries) {
      html = "<option value>--- Select One ---</option>";
      for (var i = 0; i < list_batteries.length; i++) {
        html =
          html +
          "<option value='" +
          list_batteries[i].id +
          "'>" +
          list_batteries[i].id +
          "</option>";
      }
      $("#select_battery").html(html);
      change_battery();
    }
  );
}

function change_battery() {
  $.get("get_column?battery_id=" + $("#select_battery").val(),
    function(list_columns) {
      html =
        "<option value>--- Select One ---</option><option value>--- N/Ap ---</option>";
      for (var i = 0; i < list_columns.length; i++) {
        html =
          html +
          "<option value='" +
          list_columns[i].id +
          "'>" +
          list_columns[i].id +
          "</option>";
      }
      $("#select_column").html(html);
      change_column();
    }
  );
}

function change_column() {
  $.get("get_elevator?column_id=" + $("#select_column").val(),
    function(list_elevators) {
      html =
        "<option value>--- Select One ---</option><option value>--- N/Ap ---</option>";
      for (var i = 0; i < list_elevators.length; i++) {
        html =
          html +
          "<option value='" +
          list_elevators[i].id +
          "'>" +
          list_elevators[i].id +
          "</option>";
      }
      $("#elevator").html(html);
    }
  );
}
