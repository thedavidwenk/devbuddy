import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["heart"];

  toggleFavorite(event) {
    event.preventDefault();
    const heartIcon = this.heartTarget;

    heartIcon.classList.toggle("fas");
    heartIcon.classList.toggle("far");
  }
}
