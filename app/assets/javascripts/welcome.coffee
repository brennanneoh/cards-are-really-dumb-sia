$(document).on 'turbolinks:load', () ->
  randomSuit = ->
    $.ajax
      url: '/suits/random'
      complete: ->
        setTimeout(randomSuit, 10000)
  randomSuit()
