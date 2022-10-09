import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-field"
export default class extends Controller {
  connect() {
    console.log('hello search field')

    const searchIcon = document.querySelector('.search-icon');
    const searchField = document.querySelector(".search-field");
    const searchBtn = document.querySelector(".search-btn");
    const searchHide = document.querySelector(".search-hide");

    searchIcon.addEventListener('click', (event) => {
      searchIcon.classList.toggle('d-none')
      searchField.classList.toggle('d-none')
      searchBtn.classList.toggle('d-none')
      searchHide.classList.toggle('d-none')
    })

    searchHide.addEventListener('click', (event) => {
      searchIcon.classList.toggle('d-none')
      searchField.classList.toggle('d-none')
      searchBtn.classList.toggle('d-none')
      searchHide.classList.toggle('d-none')
    })
  }
}
