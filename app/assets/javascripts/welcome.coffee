RANDOM_SUIT_INTERVAL = 10000

$(document).on 'index_welcome.load', (event) ->
  randomSuit()

randomSuit = ->
  $.ajax
    url: '/suits/random'
    complete: ->
      setTimeout(randomSuit, RANDOM_SUIT_INTERVAL)
