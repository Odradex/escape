import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")
const Russian = require("flatpickr/dist/l10n/ru.js").default.ru;

var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate()+1);


document.addEventListener("turbolinks:load", () => {
  var data = $("#date").data()
  flatpickr.localize(flatpickr.l10ns.ru);
  flatpickr("#date", {
    minDate: tomorrow,
    "locale": Russian,
    maxDate: tomorrow.fp_incr(90),
    altInput: true,
    altFormat: "F j, Y"
  })
})    