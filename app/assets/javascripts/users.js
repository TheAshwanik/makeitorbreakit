// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function (event) {
  var about = document.getElementById("about")
  var aboutText = document.getElementById("abouttext")
  var close = document.getElementById("close")
  var modalOverlay = document.querySelector(".modaloverlay")

  aboutText.style.display = "none"
  modalOverlay.style.display = "none"

  about.addEventListener("click", function () {
    aboutText.style.display = "block"
    modalOverlay.style.display = "block"
  })

  close.addEventListener("click", function () {
    aboutText.style.display = "none"
    modalOverlay.style.display = "none"
  })



})
