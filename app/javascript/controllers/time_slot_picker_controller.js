import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-slot-picker"
export default class extends Controller {
  static targets = ["timeSlotInput"]

  connect() {
    console.log("Hello Time Slot")
  }

  selectTimeSlot(event) {
    console.log(event.currentTarget.dataset.slotId)
    console.log(this.timeSlotInputTarget.value)
  }

  // getSlotId() {
  //   const slotId = this.slotIdTarget.dataset.slotId
  //   console.log("slotId", slotId)
  //   console.log(this.timeSlotInputTarget)
  //   // this.timeSlotInputTarget.value = slotId
  // }
}
