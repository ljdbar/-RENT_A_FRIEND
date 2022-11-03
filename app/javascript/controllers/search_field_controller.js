import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-field"
export default class extends Controller {
  connect() {
    console.log('hello search field');

    const searchBtn = document.querySelector('.search-btn-a');
    const cancelBtn = document.querySelector('.cancel-btn');
    const searchBox = document.querySelector('.search-box');
    const searchInput = document.querySelector('input');

    searchBtn.addEventListener('click', (event) => {
      console.log('hello search bar');
      searchBox.classList.add('active');
      searchInput.classList.add('active');
      cancelBtn.classList.add('active');
    })

    cancelBtn.addEventListener('click', (event) => {
      console.log('byebye search bar');
      searchBox.classList.remove('active');
      searchInput.classList.remove('active');
      cancelBtn.classList.remove('active');
    })


    // const searchIcon = document.querySelector('.search-icon');
    // const searchBar = document.querySelector('.search-bar');
    // const searchField = document.querySelector(".search-field");
    // const searchBtn = document.querySelector(".search-btn");
    // const searchHide = document.querySelector(".search-hide");

    // searchIcon.addEventListener('click', (event) => {
    //   searchIcon.classList.toggle('disappear')
    //   searchBar.classList.toggle('appear')
      // searchField.classList.toggle('d-none')
      // searchBtn.classList.toggle('d-none')
      // searchHide.classList.toggle('d-none')
    // })

    // searchHide.addEventListener('click', (event) => {
    //   searchIcon.classList.toggle('d-none')
      // searchField.classList.toggle('d-none')
      // searchBtn.classList.toggle('d-none')
      // searchHide.classList.toggle('d-none')
    // })
  }
}
