import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["badge"];

  connect() {
    console.log("Notification controller connected");
    this.loadNotifications();
  }

  loadNotifications() {
    fetch("/notifications")
      .then(response => response.json())
      .then(data => {
        console.log("Notifications data loaded", data);
        this.count = data.unread_count;
        this.updateBadge();
      })
      .catch(error => console.error("Error loading notifications:", error));
  }

  updateBadge() {
    console.log("Updating badge with count:", this.count);
    if (this.count > 0) {
      this.badgeTarget.classList.remove("d-none");
      this.badgeTarget.innerText = this.count;
    } else {
      this.badgeTarget.classList.add("d-none");
    }
  }
}

