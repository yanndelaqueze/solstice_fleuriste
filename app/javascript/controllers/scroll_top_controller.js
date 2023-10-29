import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-top"
export default class extends Controller {
  static targets = ["scrollBtn"];

  connect() {
    console.log("Scroll Top - HELLO");
    window.addEventListener("scroll", (e) => {
      const scroll = window.scrollY;
      const pageHeight = document.body.offsetHeight - window.innerHeight;
      const percentScroll = (scroll / pageHeight) * 100;

      if (percentScroll > 20) {
        this.scrollBtnTarget.style.display = "block";
      } else {
        this.scrollBtnTarget.style.display = "none";
      }
    });
  }

  scrollTop() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  }
}
