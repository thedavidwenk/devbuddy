import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="booking-selector"
export default class extends Controller {
  static targets = ["calendar", "slot", "dayInput", "startInput", "endInput", "timeSlotInput", "bookingDateInput"];

  connect() {

    const sanitizedTimeSlots = JSON.parse(this.element.dataset.bookingSelectorTimeSlots);
    const availableDates = sanitizedTimeSlots.map(slot => slot.date);
    console.log(availableDates)


    flatpickr(this.calendarTarget, {
      dateFormat: "Y-m-d",
      minDate: "today",
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
      },
      inline: true,
      onChange: function(selectedDates) {
        if (selectedDates) {
          const selectedDate = selectedDates[0]; // Assuming single date selection
          // Check if time slot exists for the selected date (replace with your logic)
          if (hasTimeSlot(selectedDate)) {
            // Trigger modal opening (replace with your specific modal opening method)
            document.getElementById('exampleModal').show();
          } else {
            // Handle case where no time slot exists (optional: display message)
          }
        }
      },
      onReady: function() {
        // Add click event listeners to each date element within the calendar
        this.calendarContainer.querySelectorAll('.flatpickr-day').forEach(day => {
          day.addEventListener('click', function() {
            // Logic to access the selected date from the clicked element (replace with your logic)
            const selectedDate = new Date(this.dataset.date);
            if (hasTimeSlot(selectedDate)) {
              // Trigger modal opening (replace with your specific modal opening method)
              document.getElementById('exampleModal').show();
            }
          });
        });
      }
    });
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
}
// }
