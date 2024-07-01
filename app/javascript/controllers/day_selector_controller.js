import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = ["bubble"];

  connect() {
  }

  selectDay() {
    const bubble = this.bubbleTarget;
    bubble.classList.toggle("active")
  }
}
