// app/javascript/controllers/tabs_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "pane"];

  connect() {
    this.showTabFromHash();
  }

  switch(event) {
    event.preventDefault();
    this.showTab(event.currentTarget);
  }

  showTab(tab) {
    // Remove active class from all tabs
    this.tabTargets.forEach((t) => t.classList.remove("active"));

    // Add active class to the clicked tab
    tab.classList.add("active");

    // Hide all tab contents
    this.paneTargets.forEach((content) => content.classList.remove("active"));

    // Show the clicked tab content
    const targetId = tab.getAttribute("href").substring(1);
    document.getElementById(targetId).classList.add("active");
  }

  showTabFromHash() {
    const hash = window.location.hash;
    console.log(this.tabTargets);

    if (hash) {
      const activeTab = this.tabTargets.find(
        (tab) => tab.getAttribute("href") === hash
      );
      console.log(activeTab);
      if (activeTab) {
        this.showTab(activeTab);
      }
    }
    else {
      console.log("Hello!");
      const defaultTab = this.tabTargets.find(
        (tab) => tab.getAttribute("href") === "#appointments"
      );
      this.showTab(defaultTab);
    }
  }
}
