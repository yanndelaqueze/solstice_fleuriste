import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-ribbon-message"
export default class extends Controller {
  static targets = ["ribbonCheck", "messageInputField"];

  connect() {
    console.log("hello Ruban");
    const isChecked = this.ribbonCheckTarget.checked;

    if (isChecked) {
      this.messageInputFieldTarget.style.display = "block";
    } else {
      this.messageInputFieldTarget.style.display = "none";
    }
  }

  toggleRibbonMessage(event) {
    const isChecked = this.ribbonCheckTarget.checked;

    if (isChecked) {
      this.messageInputFieldTarget.style.display = "block";
    } else {
      this.messageInputFieldTarget.style.display = "none";
    }
  }
}
