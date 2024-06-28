import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-slot-picker"
export default class extends Controller {
  static targets = ["timeSlotInput", "day", "start", "end"]

  selectTimeSlot(event) {
    this.dayTarget.innerText = `${event.currentTarget.dataset.day}`
    this.startTarget.innerText = `Start: ${event.currentTarget.dataset.startTime}`
    this.endTarget.innerText = `End: ${event.currentTarget.dataset.endTime}`

    const slotId = event.currentTarget.dataset.slotId
    this.timeSlotInputTarget.value = slotId
  }
}
