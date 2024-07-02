import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = ["bubble", "slot"];

  selectDay(event) {
    const clickedBubble = event.currentTarget;
    const bubbles = this.bubbleTargets;
    const slots = this.slotTargets;

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
  }
}
