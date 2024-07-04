import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="booking-selector"
export default class extends Controller {
  static targets = ["calendar", "slot", "dayInput", "startInput", "endInput", "timeSlotInput", "bookingDateInput"];

  connect() {
    const timeSlots = this.slotTargets
    const sanitizedTimeSlots = JSON.parse(this.element.dataset.bookingSelectorTimeSlots);
    const availableDates = sanitizedTimeSlots.map(slot => slot.date);

    flatpickr(this.calendarTarget, {
      dateFormat: "Y-m-d",
      minDate: "today",
      inline: true,
      onChange: function(selectedDates) {
        const selectedDate = selectedDates[0];

        selectedDate.setDate(selectedDate.getDate() + 1);
        const dateWithOneDayAdded = selectedDate.toISOString().slice(0, 10);

        const matchingDate = availableDates.find(date => date === dateWithOneDayAdded);
        console.log(timeSlots)

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

//   submitData() {
//     const weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
//     const day = this.slotTarget.dataset.day;
//     const startTime = this.slotTarget.dataset.startTime;
//     const endTime = this.slotTarget.dataset.endTime;
//     const timeSlotId = this.slotTarget.dataset.slotId;
//     const bookingDate = this.submitTarget.dataset.date;
//     const date = this.dateTarget.value;

//     this.dayInputTarget.innerText = `${date} (${weekday[day]}) `
//     this.startInputTarget.innerText = `Start: ${startTime}`;
//     this.endInputTarget.innerText = `End: ${endTime}`;
//     this.timeSlotInputTarget.value = timeSlotId;
//     this.bookingDateInputTarget.value = bookingDate;
