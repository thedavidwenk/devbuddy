import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="removecard"
export default class extends Controller {
  static targets = ["card"];

  clickRemove(event) {
    event.preventDefault();
    const card = this.cardTarget;
    card.classList.add("remove-card-transition");

    // Wait for the transition to complete before removing the card from the DOM
    card.addEventListener(
      "transitionend",
      () => {
        // Remove the card container from the DOM
        card.parentElement.remove();
      },
      { once: true }
    );
  }
}
