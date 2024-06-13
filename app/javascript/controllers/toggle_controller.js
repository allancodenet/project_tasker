import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets =["profileCard", "sidebar"]
  toggleProfileCard() {
   this.profileCardTarget.classList.toggle("hidden")
  }
  toggleSidebar() {
    this.sidebarTarget.classList.toggle("hidden")
  }
}
