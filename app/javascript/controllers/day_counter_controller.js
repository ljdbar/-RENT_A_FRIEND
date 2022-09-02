import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller");
  };


  disable(event) {
    console.log(event);
  }
}

// const start_date = document.getElementById("booking_start_date");
// console.log(start_date.value);

// const end_date = document.getElementById("booking_end_date");
// console.log(end_date.value);
