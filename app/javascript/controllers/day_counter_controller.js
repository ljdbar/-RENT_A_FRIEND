import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-counter"
export default class extends Controller {
  static targets = ["form"]
  static values = { position: Number }

  connect() {
    // console.log(this.formTarget)
    const booking_start_date = document.getElementById("booking_start_date");
    const booking_end_date = document.getElementById("booking_end_date");

    booking_start_date.addEventListener("change", (event) => {
      console.log(booking_start_date.value)
      // console.log(test1);
      const first_date = new Date(booking_start_date.value)

      booking_end_date.addEventListener("change", (event) => {
        console.log(booking_end_date.value)
        // console.log(test2);
        const last_date = new Date(booking_end_date.value)
        const total_days = (last_date - first_date)/(1000*60*60*24) + 1

        const daily_price = this.positionValue;
        console.log(daily_price)
        const total_price = total_days * daily_price

        const price = document.querySelector('#total-price');
        // price.insertAdjacentHTML('beforeend', 'Total price: <strong>£0</strong>');
        price.innerHTML = `Total price: £<strong>${total_price}</strong>`
    });
    });
  }
}
