scheduler.config.xml_date="%Y-%m-%d %H:%i";
scheduler.config.time_step = 15;
scheduler.config.select = false;
scheduler.xy.nav_height = 0;
var startDate = new Date();
var endDate = new Date();
startDate.setDate(startDate.getDate()); 
endDate.setDate(endDate.getDate()+90);

scheduler.config.limit_start = new Date(startDate);
scheduler.config.limit_end = new Date (endDate);
scheduler.attachEvent("onLimitViolation", function (id, obj){
    dhtmlx.message('The date is not allowed');
  });

scheduler.init("scheduler_here", new Date(), "day");
var data_path = gon.calendar_events_path;
scheduler.load(data_path, "json");

var dp = new dataProcessor(data_path);
dp.init(scheduler);
dp.setTransactionMode("REST");