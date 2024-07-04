import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="booking-selector"
export default class extends Controller {
  static targets = ["calendar", "slot", "dateInput", "startInput", "endInput", "timeSlotIdInput"];

  connect() {
    const timeSlots = this.slotTargets
    const sanitizedTimeSlots = JSON.parse(this.element.dataset.bookingSelectorTimeSlots);
    const availableDates = sanitizedTimeSlots.map(slot => slot.date);

    flatpickr(this.calendarTarget, {
      dateFormat: "Y-m-d",
      minDate: "today",
      inline: true,
      "locale": {
        "firstDayOfWeek": 1
      },
      onChange: function(selectedDates) {
        const selectedDate = selectedDates[0];

        selectedDate.setDate(selectedDate.getDate() + 1);
        const dateWithOneDayAdded = selectedDate.toISOString().slice(0, 10);
        const matchingDate = availableDates.find(date => date === dateWithOneDayAdded);

        timeSlots.forEach(slot => {
          slot.classList.add("d-none");

          if (slot.dataset.date == matchingDate) {
            slot.classList.remove("d-none");
          }
        });
      },
      enable: availableDates
    });
  }

  submitData(event) {
    console.log("hello")
    const date = event.currentTarget.dataset.date;
    console.log(date)
    const startTime = event.currentTarget.dataset.startTime;
    const endTime = event.currentTarget.dataset.endTime;
    const timeSlotId = event.currentTarget.dataset.slotId;

    this.dateInputTarget.innerText = date
    this.startInputTarget.innerText = `Start: ${startTime}`;
    this.endInputTarget.innerText = `End: ${endTime}`;
    this.timeSlotIdInputTarget.value = timeSlotId;
  }
}
//   selectDay(event) {
//     const bubbles = this.bubbleTargets;
//     const slots = this.slotTargets;
//     const clickedBubble = event.currentTarget;

//     bubbles.forEach(bubble => {
//       bubble.classList.remove("active-btn");
//     })
//     clickedBubble.classList.add("active-btn");

//     slots.forEach( (slot) => {
//       slot.classList.add("d-none")
//       if (slot.dataset.day === clickedBubble.dataset.day) {
//         slot.classList.remove("d-none");
//       }
//     });
//   }

//   selectTime(event) {
//     const clickedSlot = event.currentTarget;
//     const slots = this.slotTargets;
//     const submitButton = this.submitTarget

//     slots.forEach(slot => {
//       slot.classList.remove("active-btn");
//     })
//     clickedSlot.classList.add("active-btn");
//   }
