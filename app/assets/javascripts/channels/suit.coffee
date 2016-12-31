App.suit = App.cable.subscriptions.create('SuitChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#suits').html(data) unless data.blank?
)
