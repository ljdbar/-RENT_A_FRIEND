import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-field"
export default class extends Controller {
  connect() {
    console.log('hello search field')
  }
}
