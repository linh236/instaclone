import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="music"
export default class extends Controller {
  connect() {
  }

  detail({params: {url}}) {
    // this.element.classList.add('class', 'active')
    fetch(`${url}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }

  download({params: {url}}) {
    fetch(`${url}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
