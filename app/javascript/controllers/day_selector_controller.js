import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = ["bubble", "slot", "slots"];

  selectDay(event) {
    const clickedBubble = event.currentTarget;
    const bubbles = this.bubbleTargets;

    bubbles.forEach(bubble => {
      bubble.classList.remove("active-btn");
    })
    clickedBubble.classList.toggle("active-btn");

    

    // this.slotsTargets.classList.remove("d-none")
  }

  selectTime(event) {
    const clickedSlot = event.currentTarget;
    const slots = this.slotTargets;

    slots.forEach(slot => {
      slot.classList.remove("active-btn");
    })
    clickedSlot.classList.toggle("active-btn");
  }
}
