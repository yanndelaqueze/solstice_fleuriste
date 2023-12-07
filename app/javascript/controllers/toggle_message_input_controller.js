import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-message-input"
export default class extends Controller {
  connect() {
    console.log("hello ToggleInput");

    const selectedStatus = document.querySelector(
      'select[name="order[status]"]'
    ).value;
    console.log("selectedStatus:", selectedStatus);
    const messageInput = document.querySelector("#input-message");
    if (selectedStatus === "Livrée") {
      messageInput.style.display = "block";
    } else {
      messageInput.style.display = "none";
    }
  }

  toggleInput(event) {
    const selectedStatus = event.target.value;
    const messageInput = document.querySelector("#input-message");

    if (selectedStatus === "Livrée") {
      messageInput.style.display = "block";
    } else {
      messageInput.style.display = "none";
    }
  }
}
