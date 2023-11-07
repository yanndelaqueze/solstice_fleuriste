import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateInput", "modalMessage", "myModal"];

  checkDate(event) {
    const selectedDate = new Date(this.dateInputTarget.value);
    const today = new Date();

    // Calculate the minimum allowed date (2 days from now)
    const minDate = new Date(today);
    minDate.setDate(today.getDate() + 2);

    if (minDate.getDay() === 1) {
      minDate.setDate(minDate.getDate() + 1); // Add one more day to skip Monday
    }

    if (selectedDate < minDate || selectedDate.getDay() === 1) {
      const modalMessage = this.modalMessageTarget;
      if (selectedDate.getDay() === 1) {
        modalMessage.textContent =
          "Nous ne livrons pas le Lundi 🙁, merci de choisir un autre jour";
      } else {
        modalMessage.textContent =
          "Merci de choisir une date dans 2 jours ou plus (Lundis exclus)";
      }

      const modalElement = this.myModalTarget;
      modalElement.classList.add("show");
      modalElement.style.display = "block";

      // Close button event listener
      const closeButton = modalElement.querySelector(".btn-action");
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
