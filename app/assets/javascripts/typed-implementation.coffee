ready = ->
  Typed.new '.element',
    strings: [
      "Thanks for stopping by. Feel free to explore and don't hesitate to get in touch."
    ]
    typeSpeed: 0,
    loop: true,
    loopCount: null
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready