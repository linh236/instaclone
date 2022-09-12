import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ["show", "output"]

  showEdit({params: {id, show, url}}) {
    if (show) {
      this.outputTarget.innerHTML = '';
      this.showTarget.setAttribute("data-post-show-param", false)
    } else {
      this.outputTarget.innerHTML =
        `<ul class="m-0 p-2 border round" data-controller="post">
          <li data-post-url-param="${url}/edit" data-action="click->post#edit" class="pointer">Edit</li>
          <li class="pointer delete">
            <a href="${url}" data-turbo-method="delete">Delete</a>
          </li>
        </ul>`;
      this.showTarget.setAttribute("data-post-show-param", true)
    }
  }

  edit({params: {url}}) {
    // e.preventDefault()
    fetch(`${url}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }

  delete() {
    console.log("delete")
  }

}
