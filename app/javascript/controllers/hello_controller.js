import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // connect() {
  //   this.element.textContent = "Hello World!"
  // }

  static targets = [ "output" ]
  greet() {
    this.outputTarget.textContent =
      `Hello,`
  }
}
