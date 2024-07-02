import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["day"]

  // connect() {
  //   const selectedDay = this.dayTarget.dataset.day
  //   console.log(selectedDay)

  //   flatpickr(this.element, {
  //     dateFormat: "Y-m-d",
  //     minDate: "today",
  //     "disable": [
  //       function(date) {
  //         return (date.getDay() !== selectedDay);
  //       }
  //     ],
  //     "locale": {
  //       "firstDayOfWeek": 1 // start week on Monday
  //     }
  //   });
  // }
}
