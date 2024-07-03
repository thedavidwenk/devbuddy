import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = ["bubble", "slot", "datepicker", "submit", "dayInput", "startInput", "endInput", "timeSlotInput", "date"];

  connect() {
    const submitButton = this.submitTarget

    this.fp = flatpickr(this.dateTarget, { // Store the instance
      dateFormat: "Y-m-d",
      minDate: "today",
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
      },
      onChange: function(selectedDates) {
        if (selectedDates) {
          submitButton.classList.remove("d-none");
        }
      }
    });
  }

  selectDay(event) {
    const bubbles = this.bubbleTargets;
    const slots = this.slotTargets;
    const clickedBubble = event.currentTarget;

    bubbles.forEach(bubble => {
      bubble.classList.remove("active-btn");
    })
    clickedBubble.classList.add("active-btn");

    slots.forEach( (slot) => {
      slot.classList.add("d-none")
      if (slot.dataset.day === clickedBubble.dataset.day) {
        slot.classList.remove("d-none");
      }
    });
  }

  selectTime(event) {
    const clickedSlot = event.currentTarget;
    const slots = this.slotTargets;

    slots.forEach(slot => {
      slot.classList.remove("active-btn");
    })
    clickedSlot.classList.add("active-btn");

    this.fp.config.disable = [ // Access existing instance config
      function(date) {
        let dayValue = parseInt(clickedSlot.dataset.day);
        return (date.getDay() !== dayValue);
      }
    ];
  }

  submitData() {
    const weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    const day = this.slotTarget.dataset.day;
    const startTime = this.slotTarget.dataset.startTime;
    const endTime = this.slotTarget.dataset.endTime;
    const timeSlotId = this.slotTarget.dataset.slotId;
    const date = this.dateTarget.value;

    this.dayInputTarget.innerText = `${date} (${weekday[day]}) `
    this.startInputTarget.innerText = `Start: ${startTime}`;
    this.endInputTarget.innerText = `End: ${endTime}`;
    this.timeSlotInputTarget.value = timeSlotId;
  }
}
