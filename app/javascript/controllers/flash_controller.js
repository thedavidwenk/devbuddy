import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
 static targets = ["message"];

  connect() {
    this.hideAfterDelay();
  }

  hideAfterDelay() {
    setTimeout(() => {
      this.fadeOut();
    }, 3000);
  }

  fadeOut() {
    this.messageTarget.classList.add("fade-out");
  }
}
