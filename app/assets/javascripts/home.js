// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// = require velocity.min.js
 //= require_scrollmagic ./scrollmagic.js
document.addEventListener("DOMContentLoaded", function(event) {
  var controller = new ScrollMagic.Controller({
    globalSceneOptions: {
      triggerHook: 'onLeave'
    }
  });

  // get all slides
  var slides = document.querySelectorAll("section.panel");

  // create scene for every slide
  for (var i=0; i<slides.length; i++) {
    new ScrollMagic.Scene({
        triggerElement: slides[i]
      })
      .setPin(slides[i])
      .addTo(controller);
    }

  var bigBurger = document.querySelector('.bigburger')
  var navLink = document.querySelectorAll('.navlink')
  var drop = document.querySelector('#drop')

  bigBurger.addEventListener( "click", function() {
    this.classList.toggle( "change" );
    for (var i = 0; i < navLink.length; i++){
      if (navLink[i].style.display === 'block') {
        navLink[i].style.display = 'none';
      } else {
        navLink[i].style.display = 'block';
      }
     }
     if (drop.style.display === 'block') {
       drop.style.display = 'none';
     } else {
       drop.style.display = 'block';
     }

  });
})
