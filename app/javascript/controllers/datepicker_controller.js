import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      dateFormat: "Y-m-d",
      minDate: "today",
      "disable": [
        function(date) {
          // return true to disable
          return (date.getDay() !== 1); /* insert Value from slot.day here */
        }
      ],
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
      }
    });
  }
}
