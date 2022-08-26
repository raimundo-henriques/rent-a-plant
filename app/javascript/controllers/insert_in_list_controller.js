import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["reviews", "form"]
  connect() {
    // console.log("controller", this.element);
    // console.log("reviews", this.reviewsTarget);
    // console.log("form", this.formTarget);
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_review) {
          this.reviewsTarget.insertAdjacentHTML("beforeend", data.inserted_review)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
