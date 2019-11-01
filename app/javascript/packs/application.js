// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("moment")
require("fullcalendar/dist/fullcalendar")

// local time allow us to display the time update in the current browser time zone. The time relative to the user
// require("local-time").start()

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

import 'bootstrap';
import 'bootstrap/js/dist/modal';


$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")
require("flatpickr/dist/themes/confetti.css");

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr']", {
    altInput: true,
    altFormat: "F, j, Y",
    dateFormat: "Y-m-d",

//disables the 2019 Fiestas Patrias week dates:
    disable: [
        {
            from: "2019-09-15",
            to: "2019-09-22"
        }
    ],

//disables Sundays:
    disable: [
      function(date) {
        // return true to disable
        return (date.getDay() === 0 || date.getDay() === 7);
      }
    ],

//sets Mondays as first day if the week
    locale: {
      "firstDayOfWeek": 1 // start week on Monday
    },

//Allows to select multiple dates (maybe for suspensions?)
      // mode: "multiple",
  })
})


//Time picker for project
document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr-time']", {
    // altInput: true,
    enableTime: true,
    noCalendar: true,
    time_24hr: true,
    minTime: "07:00",
    maxTime: "20:30"
  })
})
