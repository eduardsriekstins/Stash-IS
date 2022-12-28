import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() { }
  connect() { }
  changeForm(event) { 
    event.preventDefault();
    event.stopPropagation();
    const taskID = event.params["form"];
    const taskNameID = event.params["name"];
    const taskDescriptionID = event.params["description"];
    const taskStatusID = event.params["status"];
    const form = document.getElementById(taskID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    const taskName = document.getElementById(taskNameID);
    taskName.classList.toggle("d-none")
    const taskDescription = document.getElementById(taskDescriptionID);
    taskDescription.classList.toggle("d-none");
    const taskStatus = document.getElementById(taskStatusID);
    taskStatus.classList.toggle("d-none");
  }
}
