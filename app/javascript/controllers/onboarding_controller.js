import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"];

  fill(event) {
    event.preventDefault();
    const formData = new FormData(this.formTarget);
    const queryParams = new URLSearchParams(formData).toString();
    const url = `${this.formTarget.action}?${queryParams}`;
    window.location.href = url;
  }
}
