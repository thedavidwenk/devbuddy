// app/javascript/controllers/availability_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "button",
    "daySlots",
    "table",
    "form",
    "noTimeSlotsCreatedYet",
  ];

  connect() {
    console.log("hello from availability controller");
    this.selectedDay = null;
  }

  // highlights clicked day,
  // picks up weekday name,
  // display slots table or alert message ----- >

  showDay(event) {
    this.clearActiveButtons();
    const dayButton = event.currentTarget;
    console.dir(dayButton);
    dayButton.classList.add("active");

    const day = dayButton.dataset.day;

    this.selectedDay = day;
    console.log(this.selectedDay);

    this.daySlotsTargets.forEach((daySlot) => {
      daySlot.style.display = daySlot.dataset.day === day ? "block" : "none";
    });

    const slotsForDay = this.daySlotsTargets.find(
      (slot) => slot.dataset.day === day
    );
    if (
      slotsForDay &&
      slotsForDay.querySelector(".custom-availability-table")
    ) {
      this.showTable(slotsForDay);
    } else {
      this.showNoTimeSlots(slotsForDay);
    }
  }

  clearActiveButtons() {
    this.buttonTargets.forEach((button) => button.classList.remove("active"));
  }

  showTable(slotsForDay) {
    this.formTarget.style.display = "none";
    const table = slotsForDay.querySelector(".custom-availability-table");
    table.style.display = "block";
  }

  showForm(event) {
    this.hideAllTables();
    this.hideNoTimeSlots();
    this.formTarget.style.display = "block";

    const selectedDayInput = this.formTarget.querySelector(
      'input[name="time_slot[day]"]'
    );
    if (selectedDayInput) {
      selectedDayInput.value = this.selectedDay;
    }
  }

  hideAllTables() {
    this.tableTargets.forEach((table) => (table.style.display = "none"));
  }

  showNoTimeSlots(slotsForDay) {
    this.formTarget.style.display = "none";
    const noTimeSlotsMessage = slotsForDay.querySelector(
      ".no-time-slots-created-yet"
    );
    noTimeSlotsMessage.style.display = "block";
  }

  hideNoTimeSlots() {
    this.noTimeSlotsCreatedYetTargets.forEach(
      (message) => (message.style.display = "none")
    );
  }
}
