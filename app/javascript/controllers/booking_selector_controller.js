import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="booking-selector"
export default class extends Controller {
  static targets = ["calendar", "slot", "dateInput", "startInput", "endInput", "timeSlotIdInput", "headline"];

  connect() {
    const timeSlots = this.slotTargets;
    const headlineText = this.headlineTarget;
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
        console.log(headlineText)

        selectedDate.setDate(selectedDate.getDate() + 1);
        const dateWithOneDayAdded = selectedDate.toISOString().slice(0, 10);
        const matchingDate = availableDates.find(date => date === dateWithOneDayAdded);

        timeSlots.forEach(slot => {
          slot.classList.add("d-none");

          if (slot.dataset.date == matchingDate) {
            slot.classList.remove("d-none");
            headlineText.classList.add("d-none");
          }
        });
      },
      enable: availableDates
    });
  }

  submitData(event) {
    const date = event.currentTarget.dataset.date;
    const startTime = event.currentTarget.dataset.startTime;
    const endTime = event.currentTarget.dataset.endTime;
    const timeSlotId = event.currentTarget.dataset.slotId;

    this.dateInputTarget.innerText = date
    this.startInputTarget.innerText = `Start: ${startTime}`;
    this.endInputTarget.innerText = `End: ${endTime}`;
    this.timeSlotIdInputTarget.value = timeSlotId;
  }
}
