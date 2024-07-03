import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = ["bubble", "slot", "datepicker", "submit", "dayInput", "startInput", "endInput", "timeSlotInput", "date"];

  connect() {

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
    const submitButton = this.submitTarget

    slots.forEach(slot => {
      slot.classList.remove("active-btn");
    })
    clickedSlot.classList.add("active-btn");

    const fp = flatpickr(this.dateTarget, {
      dateFormat: "Y-m-d",
      minDate: "today",
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
      },
      onChange: function(selectedDates) {
        if (selectedDates) {
          submitButton.classList.remove("d-none");
        }
      },
      "disable": [
        function(date) {
          let dayValue = parseInt(clickedSlot.dataset.day);
          return (date.getDay() !== dayValue);
        }
      ]
    });

    console.log(fp.input)
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
