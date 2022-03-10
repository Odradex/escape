import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")

var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate()+1);


document.addEventListener("turbolinks:load", () => {
  var data = $("#date").data()
  flatpickr("#date", {
    minDate: tomorrow,
    maxDate: tomorrow.fp_incr(90),
    altInput: true,
    altFormat: "F j, Y"
  })
})    