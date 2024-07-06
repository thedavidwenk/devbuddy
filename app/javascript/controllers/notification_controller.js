import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["badge"];

  connect() {
    // Initially hide the badge
    this.toggleBadgeVisibility();
    this.loadNotifications();
  }

  loadNotifications() {
    fetch("/notifications")
      .then(response => response.json())
      .then(data => {
        this.count = data.unread_count;
        this.updateBadge();
        this.toggleBadgeVisibility();
      });
  }

  toggleBadgeVisibility() {
    if (this.count > 0) {
      this.badgeTarget.classList.remove("d-none");
    } else {
      this.badgeTarget.classList.add("d-none");
    }
  }

  updateBadge() {
    this.badgeTarget.innerText = this.count;
  }

  markAsRead(event) {
    const notificationId = event.target.dataset.notificationId;
    fetch(`/notifications/${notificationId}/mark_as_read`, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Content-Type': 'application/json'
      }
    }).then(response => response.json())
      .then(data => {
        if (data.success) {
          this.loadNotifications();
        }
      });
  }
}

