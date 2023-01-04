import { Controller } from "@hotwired/stimulus"

  import Lightbox from 'stimulus-lightbox'

  const application = Application.start()
  application.register('lightbox', Lightbox)

// Connects to data-controller="lightbox"
export default class extends Controller {
  connect() {
  }
}
