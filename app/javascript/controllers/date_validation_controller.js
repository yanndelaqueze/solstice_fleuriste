import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateInput", "modalMessage", "myModal"];

  checkDate(event) {
    const selectedDate = new Date(this.dateInputTarget.value);
    const today = new Date();
    // Set the time component to midnight
    today.setHours(0, 0, 0, 0);

    // Calculate the minimum allowed date (2 days from now)
    const minDate = new Date(today);
    minDate.setDate(today.getDate() + 2);

    if (minDate.getDay() === 1) {
      minDate.setDate(minDate.getDate() + 1); // Add one more day to skip Monday
    }

    // Array to store bank holidays (format: month/day)
    const bankHolidays = ["1/1", "12/25", "7/14"];

    // Check if the selected date is a bank holiday
    const selectedMonth = selectedDate.getMonth() + 1; // Month is zero-indexed
    const selectedDay = selectedDate.getDate();
    const formattedSelectedDate = `${selectedMonth}/${selectedDay}`;
    console.log(formattedSelectedDate);
    const isBankHoliday = bankHolidays.includes(formattedSelectedDate);

    if (selectedDate.getDay() === 0) {
      this.toggleSoirOption(false);
    } else {
      // Show the "Soir" option if it's not Sunday
      this.toggleSoirOption(true);
    }

    if (
      selectedDate < minDate ||
      selectedDate.getDay() === 1 ||
      isBankHoliday
    ) {
      const modalMessage = this.modalMessageTarget;
      if (selectedDate.getDay() === 1) {
        modalMessage.textContent =
          "Nous ne livrons pas le Lundi 🙁, merci de choisir un autre jour";
      } else if (isBankHoliday) {
        modalMessage.textContent =
          "Nous ne livrons pas les jours fériés 🙁, merci de choisir un autre jour";
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

  toggleSoirOption(show) {
    const soirOption = document.querySelector("#order_time_slot_soir");
    if (soirOption) {
      soirOption.parentElement.style.display = show ? "block" : "none";
    }
  }
}
