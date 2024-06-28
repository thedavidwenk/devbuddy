import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button", "table", "form"];

  connect() {
    this.updateView();
  }

  showDay(event) {
    this.clearActiveButtons();
    event.currentTarget.classList.add("active");

    const day = event.currentTarget.dataset.day;
    this.tables.forEach((table) => {
      table.style.display = table.dataset.day === day ? "block" : "none";
    });

    this.hideForm();
  }

  showForm() {
    this.tables.forEach((table) => (table.style.display = "none"));
    this.formTarget.style.display = "block";
  }

  clearActiveButtons() {
    this.buttons.forEach((button) => button.classList.remove("active"));
  }

  hideForm() {
    this.formTarget.style.display = "none";
  }

  get buttons() {
    return this.buttonTargets;
  }

  get tables() {
    return this.tableTargets;
  }
}
