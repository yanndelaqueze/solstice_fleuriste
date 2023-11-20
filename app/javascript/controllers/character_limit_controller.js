import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="character-limit"
export default class extends Controller {
  static targets = ["input", "counter"];

  connect() {
    console.log("hello character check");
  }

  checkCharacters() {
    const currentLength = this.inputTarget.value.length;
    const maxLength = this.inputTarget.getAttribute("maxlength");
    this.counterTarget.innerText = `${maxLength} caractères max. (${currentLength}/${maxLength})`;
    if (currentLength > maxLength) {
      this.inputTarget.value = this.inputTarget.value.slice(0, maxLength);
    }
  }
}
