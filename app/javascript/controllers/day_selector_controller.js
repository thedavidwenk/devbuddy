import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = ["bubble", "slot"];

  connect() {
  }

  selectDay(event) {
    const clickedBubble = event.currentTarget
    const bubbles = this.bubbleTargets;

    bubbles.forEach(bubble => {
      bubble.classList.remove("active")
    })
    clickedBubble.classList.toggle("active")
  }

  selectTime(event) {
    const clickedSlot = event.currentTarget
    const slots = this.slotTargets;

    slots.forEach(slot => {
      slot.classList.remove("active")
    })
    clickedSlot.classList.toggle("active")
  }
}
