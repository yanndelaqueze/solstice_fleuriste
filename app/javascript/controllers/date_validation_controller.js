import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateInput", "modalMessage", "myModal"];

  checkDate(event) {
    const selectedDate = new Date(this.dateInputTarget.value);
    const today = new Date();

    // Calculate the minimum allowed date (2 days from now)
    const minDate = new Date(today);
    minDate.setDate(today.getDate() + 2);

    if (selectedDate < minDate) {
      const modalMessage = this.modalMessageTarget;
      modalMessage.textContent =
        "Merci de choisir une date dans 2 jours ou plus";

      const modalElement = this.myModalTarget;
      modalElement.classList.add("show");
      modalElement.style.display = "block";

      // Close button event listener
      const closeButton = modalElement.querySelector(".btn-secondary");
      if (closeButton) {
        closeButton.addEventListener("click", () => {
          modalElement.classList.remove("show");
          modalElement.style.display = "none";
        });
      }

      // "X" button (close icon) event listener
      const closeIcon = modalElement.querySelector(".close");
      if (closeIcon) {
        closeIcon.addEventListener("click", () => {
          modalElement.classList.remove("show");
          modalElement.style.display = "none";
        });
      }

      // Handle modal close when clicking outside the modal
      modalElement.addEventListener("click", (e) => {
        if (e.target === modalElement) {
          modalElement.classList.remove("show");
          modalElement.style.display = "none";
        }
      });

      this.dateInputTarget.value = "";
    }
  }
}
