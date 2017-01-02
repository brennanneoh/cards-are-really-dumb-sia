App.suit = App.cable.subscriptions.create 'RandomSuitChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.blank?
      $('#cards').html(data)
      $('.card').fadeIn('slow').css('display', 'inline-block')
