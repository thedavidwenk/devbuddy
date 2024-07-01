import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removecard"
export default class extends Controller {
  static targets = ["card"];

  toggleRemove(event) {
    event.preventDefault();
    const card = this.cardTarget;
    card.classList.add("d-none");
  }
}
