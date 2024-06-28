import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["count"];

  connect() {
    // This timeout removes the notification after 5 seconds
    const notificationElement = this.element;
    setTimeout(() => {
      notificationElement.remove();
    }, 3000);

    this.loadNotifications();
  }

  loadNotifications() {
    fetch("/notifications")
      .then(response => response.json())
      .then(data => {
        this.countTarget.innerText = data.unread_count;
      });
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
