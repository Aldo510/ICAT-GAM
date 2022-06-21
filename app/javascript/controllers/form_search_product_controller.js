import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-search-product"
export default class extends Controller {
  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }
  active(event){
    console.log("Se ha agregado el nuevo producto");
    const csrtToken = document.querySelector('meta[name="csrf-token"]').content;
    fetch('ourse/add_data_sheet', {
      method: "POST",
      mode: "cors",
      cache: "no-cache",
      credentials: "same-origin",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrtToken
      },
      body: JSON.stringify({ completed: event.target.checked })
    })
    .then(response => response.text())
    .then(Turbo.renderStreamMessage)
  }
}
