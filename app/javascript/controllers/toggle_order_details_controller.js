import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-order-details"
export default class extends Controller {
  static targets = ["details", "button"];

  connect() {
    console.log("Hello Toggle Order Details");
    this.hideDetails();
  }

  toggleDetails() {
    if (this.detailsTarget.classList.contains("hidden")) {
      this.showDetails();
    } else {
      this.hideDetails();
    }
  }

  showDetails() {
    this.detailsTarget.classList.remove("hidden");
    this.buttonTarget.innerText = "Masquer les détails";
  }

  hideDetails() {
    this.detailsTarget.classList.add("hidden");
    this.buttonTarget.innerText = "Afficher les détails";
  }
}
