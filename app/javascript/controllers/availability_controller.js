// app/javascript/controllers/availability_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "button",
    "daySlots",
    "table",
    "form",
    "noTimeSlotsCreatedYet",
    "dayField",
  ];

  connect() {
    console.log("hello from availability controller");
    this.selectedDay = null;
  }

  showDay(event) {
    this.clearActiveButtons(); // <--- removes active class from any other button

    const dayButton = event.currentTarget;
    dayButton.classList.add("active");

    const day = dayButton.dataset.day; // <--- stores value of data-day
    this.selectedDay = day; // <--- stores value of data-day in a controller property (integer)
    console.log(this.selectedDay);

    // show the correspondent day slots --------- >

    this.daySlotsTargets.forEach((daySlot) => {
      daySlot.style.display = daySlot.dataset.day === day ? "block" : "none";
    });

    const slotsForDay = this.daySlotsTargets.filter(
      (slot) => slot.dataset.day === day
    );

    if (
      slotsForDay.length > 0 &&
      slotsForDay.some((slot) =>
        slot.querySelector(".custom-availability-table")
      )
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
    slotsForDay.forEach((slot) => {
      const table = slot.querySelector(".custom-availability-table");
      if (table) {
        table.style.display = "block";
      }
    });
  }

  showForm(event) {
    console.log("hello from showForm function!");
    this.hideAllTables();
    this.hideNoTimeSlots();
    this.formTarget.style.display = "block";

    if (this.selectedDay !== null) {
      this.dayFieldTarget.value = this.selectedDay;
    }
  }

  hideAllTables() {
    this.tableTargets.forEach((table) => (table.style.display = "none"));
  }

  showNoTimeSlots(slotsForDay) {
    this.formTarget.style.display = "none";
    slotsForDay.forEach((slot) => {
      const noTimeSlotsMessage = slot.querySelector(
        ".no-time-slots-created-yet"
      );
      if (noTimeSlotsMessage) {
        noTimeSlotsMessage.style.display = "block";
      }
    });
  }

  hideNoTimeSlots() {
    this.noTimeSlotsCreatedYetTargets.forEach(
      (message) => (message.style.display = "none")
    );
  }

  stopPropagation(event) {
    event.stopPropagation();
  }
}
