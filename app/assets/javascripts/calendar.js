var room_select = $('#room_select')[0].cloneNode(true);
var user_select = $('#user_select')[0].cloneNode(true);
var service_select = $('#service_select')[0].cloneNode(true);
scheduler.form_blocks["user_selector"]={
  render:function(config){
      return user_select.outerHTML;
  },
  set_value:function(node,value,ev,config){
      $("#user_user_id").selectpicker('val', value);
  },
  get_value:function(node,ev,config){
      return node.querySelector("select").value;
  },
  focus:function(node){
      node.querySelector("select").value.focus();
  }
};

scheduler.form_blocks["room_selector"]={
  render:function(config){
      return room_select.outerHTML;
  },
  set_value:function(node,value,ev,config){
      $("#room_room_id").selectpicker('val', value);
  },
  get_value:function(node,ev,config){
      return node.querySelector("select").value;
  },
  focus:function(node){
      node.querySelector("select").value.focus();
  }
};

scheduler.form_blocks["service_selector"]={
  render:function(config){
      return service_select.outerHTML;
  },
  set_value:function(node,value,ev,config){
      $("#services-select").selectpicker('val', value);
  },
  get_value:function(node,ev,config){
      console.log($("#services-select").val());
      return $("#services-select").val().join(',');
  },
  focus:function(node){
      node.querySelector("select").value.focus();
  }
};

scheduler.config.xml_date="%Y-%m-%d %H:%i";
scheduler.config.time_step = 15;
scheduler.config.details_on_dblclick=true;
scheduler.config.details_on_create=true;
scheduler.config.select = false;

var startDate = new Date();
var endDate = new Date();
startDate.setDate(startDate.getDate()); 
endDate.setDate(endDate.getDate()+90);

scheduler.config.limit_start = new Date(startDate);
scheduler.config.limit_end = new Date (endDate);
scheduler.attachEvent("onLimitViolation", function (id, obj){
    dhtmlx.message('The date is not allowed');
  });

scheduler.init("scheduler_here", new Date(), "week");
scheduler.locale.labels.section_details = "Details";
scheduler.config.lightbox.sections.shift();
scheduler.config.lightbox.sections.push({name:"User", height:60, type:"user_selector", map_to:"user_id"});
scheduler.config.lightbox.sections.push({name:"Room", height:60, type:"room_selector", map_to:"room_id"});
scheduler.config.lightbox.sections.push({name:"Services", height:60, type:"service_selector", map_to:"services"});
var data_path = gon.calendar_events_path;
scheduler.load(data_path, "json");

var dp = new dataProcessor(data_path);
dp.init(scheduler);
dp.setTransactionMode("REST");