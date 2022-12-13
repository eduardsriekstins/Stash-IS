import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() { }
  connect() { }
  changeForm(event) { 
    event.preventDefault();
    event.stopPropagation();
    const commentID = event.params["form"];
    const commentBodyID = event.params["body"];
    const form = document.getElementById(commentID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    const commentBody = document.getElementById(commentBodyID);
    commentBody.classList.toggle("d-none");
    
  }
}
