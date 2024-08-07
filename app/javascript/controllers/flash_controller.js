import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {

  connect() {
    this.hideAfterDelay();
  }

  hideAfterDelay() {
    setTimeout(() => {
      this.fadeOut();
    }, 3000);
  }

  fadeOut() {
    this.element.classList.add("fade-out");
  }
}
