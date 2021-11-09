import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";

// Default tui popups
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';

var calendar = new Calendar('#calendar', {
  defaultView: 'week',
  taskView: true,
  template: {
    monthDayname: function(dayname) {
      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
    }
  },
  useCreationPopup: true
});