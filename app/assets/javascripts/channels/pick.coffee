App.pick = (gameId) ->
  App.cable.subscriptions.create { channel: 'PickChannel', game_id: gameId },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server
      #
    select: (gameId) ->
      @perform 'select', { hand_id: gameId }

    received: (data) ->
      unless data.blank?
        $('#picks').html(data)
