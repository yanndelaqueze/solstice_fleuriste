import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {}

  coucou() {
    console.log("COUCOU");
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
