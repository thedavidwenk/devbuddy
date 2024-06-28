import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["heart"];

  toggleFavorite(event) {
    event.preventDefault();
    const heartIcon = this.heartTarget;

    const isFavorited = heartIcon.classList.contains("fas");

    const url = this.data.get("url");
    const token = document.querySelector('meta[name="csrf-token"]').content;

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then((data) => {
        console.log(data.message); // Log success message

        // Toggle the heart icon based on the current state
        if (isFavorited) {
          heartIcon.classList.remove("fas");
          heartIcon.classList.add("far");
        } else {
          heartIcon.classList.remove("far");
          heartIcon.classList.add("fas");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}
