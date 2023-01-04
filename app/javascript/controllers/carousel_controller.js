import { Controller } from "@hotwired/stimulus"
  import Carousel from 'stimulus-carousel'

  const application = Application.start()
  application.register('carousel', Carousel)
// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
  }
}
