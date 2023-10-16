import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="image-hover"
export default class extends Controller {
  static targets = ["image"];
  static values = { secondImage: String };

  connect() {
    console.log("image hover hello");
    console.log(this.secondImageValue);
  }

  showMouseEnter() {
    this.originalImage = this.imageTarget.src;
    this.imageTarget.src = this.secondImageValue;
  }

  showMouseLeave() {
    this.imageTarget.src = this.originalImage;
  }
}
