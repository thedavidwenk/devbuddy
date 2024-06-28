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
  }

  showDay(event) {
    this.clearActiveButtons();
    const dayButton = event.currentTarget;
    dayButton.classList.add("active");

    const day = dayButton.dataset.day;
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

  showForm(event) {
    this.hideAllTables();
    this.hideNoTimeSlots();
    this.formTarget.style.display = "block";
  }

  clearActiveButtons() {
    this.buttonTargets.forEach((button) => button.classList.remove("active"));
  }

  hideAllTables() {
    this.tableTargets.forEach((table) => (table.style.display = "none"));
  }

  showTable(slotsForDay) {
    this.formTarget.style.display = "none";
    const table = slotsForDay.querySelector(".custom-availability-table");
    table.style.display = "block";
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
