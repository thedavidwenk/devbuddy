import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-slot-picker"
export default class extends Controller {
  static targets = ["timeSlotInput"]

  selectTimeSlot(event) {
    console.log(event.currentTarget.dataset.slotId)
    const slotId = event.currentTarget.dataset.slotId
    console.log(slotId)
    this.timeSlotInputTarget.value = slotId
    console.log(this.timeSlotInputTarget.value)
  }
}
