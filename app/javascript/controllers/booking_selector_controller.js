import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="booking-selector"
export default class extends Controller {
  static targets = ["calendar", "slot", "dateInput", "timeInput", "timeSlotIdInput", "headline"];

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
        selectedDate.setDate(selectedDate.getDate() + 1); // increasing the day by 1 because it's one day off
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
    const date = new Date(event.currentTarget.dataset.date);
    const formattedDate = date.toDateString();
    const startTime = event.currentTarget.dataset.startTime;
    const endTime = event.currentTarget.dataset.endTime;
    const timeSlotId = event.currentTarget.dataset.slotId;

    this.dateInputTarget.innerText = formattedDate;
    this.timeInputTarget.innerText = `${startTime} - ${endTime}`;
    this.timeSlotIdInputTarget.value = timeSlotId;
  }
}
