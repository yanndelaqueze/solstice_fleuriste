import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cart-display"
export default class extends Controller {
  static targets = ["cartContent"];

  connect() {
    console.log("Hello Cart");
    this.hideCart();
  }

  showCart() {
    this.cartContentTarget.style.display = "block";
  }

  hideCart() {
    this.cartContentTarget.style.display = "none";
  }
}
