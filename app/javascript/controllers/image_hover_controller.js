import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="image-hover"
export default class extends Controller {
  static targets = ["image"];

  connect() {
    console.log("image hover hello");
  }

  showMouseEnter() {
    this.originalImage = this.imageTarget.src;
    this.imageTarget.src = this.element.getAttribute("data-second-image");
  }

  showMouseLeave() {
    this.imageTarget.src = this.originalImage;
  }
}
