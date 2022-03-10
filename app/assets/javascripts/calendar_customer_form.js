var data_path = gon.calendar_events_path;

$(document).on("change", "#organization_organization_id", function(){
  var organization_id = $(this).val();
  $.ajax({
    url: "/organizations/" + organization_id + "/rooms",
    method: "GET",
    dataType: "json",
    data: {organization_id: organization_id},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
      var rooms = response;
      $("#room_room_id").empty();

      for(var i=0; i< rooms.length; i++){
        $("#room_room_id").append('<option value="' + rooms[i]["id"] + '">' + rooms[i]["number"] + '</option>');
      }
      $("#room_room_id").selectpicker('refresh');
    }
  });
  scheduler.load(data_path + "?organization_id=" + organization_id);
});

$(document).on("change", "#date", function(){
  var date = $(this).val();
  scheduler.setCurrentView(new Date(date));
});


$(document).on("change", "#services-select", function(){
  $.ajax({
    url: "/total_service_price",
    method: "GET",
    dataType: "json",
    data: {service_ids: $("#services-select").selectpicker("val")},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
      $("#services-price").text('$' + response);
    }
  });
});
var event_start_date = 0;

$(document).on("click", "#submit-button", function(){
  $.ajax({
     url: "/reservations",
     type: "post",
     dataType: "json",
     data: { 
       room_id: $("#room_room_id").val(),
       event_start_date: event_start_date,
       service_ids: $("#services-select").selectpicker("val")
     },
     success: function(response) {
       console.log(response);
       document.location.href="/";
     }
 });
 return false;
})

scheduler.config.first_hour = 8;
scheduler.config.last_hour = 24;
scheduler.config.xml_date="%Y-%m-%d %H:%i";
scheduler.config.time_step = 15;
scheduler.config.select = false;
scheduler.xy.nav_height = 0;
var startDate = new Date();
var endDate = new Date();
startDate.setDate(startDate.getDate()); 
endDate.setDate(endDate.getDate()+90);

scheduler.config.lightbox.sections.shift();
scheduler.config.limit_start = new Date(startDate);
scheduler.config.limit_end = new Date (endDate);
scheduler.attachEvent("onLimitViolation", function (id, obj){
  dhtmlx.message('The date is not allowed');
});
scheduler.attachEvent("onEventSave",function(id,ev,is_new){
  event_start_date = ev.start_date.getTime();
  ev.organization_id = $("#organization_organization_id").val();
  $.ajax({
    url: "/rooms/" + $("#room_room_id").selectpicker("val"),
    method: "GET",
    dataType: "json",
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
      $("#rental-price").text('Room rental: $' + (Math.abs(ev.end_date - ev.start_date) / 36e5) * response.hourly_payment);
    }
  });
  
  
  return true;
})

scheduler.init("scheduler_here", new Date(), "day");
scheduler.load(data_path, "json");

var dp = new dataProcessor(data_path);
dp.init(scheduler);
dp.setTransactionMode("REST");