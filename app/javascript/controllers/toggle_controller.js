import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets =["profileCard", "notificationCard", "sidebar"]
  toggleProfileCard() {
   this.profileCardTarget.classList.toggle("hidden")
  }
  toggleNotificationCard() {
   this.notificationCardTarget.classList.toggle("hidden")
  }
  toggleSidebar() {
    this.sidebarTarget.classList.toggle("hidden")
  }
}
