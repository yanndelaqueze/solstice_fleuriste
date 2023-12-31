import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-delivery-fields"
export default class extends Controller {
  static targets = ["deliveryFields"];

  connect() {
    const selectedTransport = document.querySelector(
      'input[name="order[transport]"]:checked'
    ).value;
    const deliveryFields = document.querySelector("#delivery-fields");

    if (selectedTransport === "Livraison") {
      deliveryFields.style.display = "block";
    } else {
      deliveryFields.style.display = "none";
    }
  }

  toggleFields(event) {
    const selectedTransport = event.target.value;

    if (selectedTransport === "Livraison") {
      this.deliveryFieldsTarget.style.display = "block";
    } else {
      this.deliveryFieldsTarget.style.display = "none";
    }
  }
}
