import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-slot-picker"
export default class extends Controller {
  static targets = ["slotId", ]

  connect() {
    console.log("Hello Time Slot")
  }

  getSlotId() {
    const slotId = this.slotIdTarget.dataset.slotId
    console.log(slotId)
    this.timeSlotInputTarget.value = slotId
  }
}
