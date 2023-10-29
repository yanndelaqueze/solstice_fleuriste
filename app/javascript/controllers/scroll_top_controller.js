import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-top"
export default class extends Controller {
  static targets = ["scrollBtn"];

  connect() {
    console.log("Scroll Top - HELLO");
  }

  display() {
    console.log("scrolling");
    if (
      document.body.scrollTop > 20 ||
      document.documentElement.scrollTop > 20
    ) {
      this.scrollBtnTarget.style.display = "block";
    } else {
      this.scrollBtnTarget.style.display = "none";
    }
  }

  scrollTop() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  }
}
