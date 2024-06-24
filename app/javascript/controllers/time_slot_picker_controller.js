import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-slot-picker"
export default class extends Controller {
  static targets = ["slotId", "timeSlotInput"]

  connect() {
    console.log("Hello Time Slot")
  }

  getSlotId() {
    const slotId = this.slotIdTarget.dataset.slotId
    console.log(slotId)
    console.log(this.timeSlotInputTarget)
    // this.timeSlotInputTarget.value = slotId
  }
}
