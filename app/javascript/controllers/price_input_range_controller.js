import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="price-input-range"
export default class extends Controller {
  static targets = ["valuePrice", "labelPrice"];

  connect() {
    console.log("Price Input - HELLO");
    console.log(this.labelPriceTarget.innerText);
    console.log(this.valuePriceTarget.value);
  }

  changePrice() {
    console.log(this.valuePriceTarget.value);
    this.labelPriceTarget.innerText = `€${this.valuePriceTarget.value}.00`;
  }
}
