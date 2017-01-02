$(document).on 'show_games.load', (event) ->
  App.pick $('#picks').data('game-id')
  $(document).on 'click', '#hands .card', () ->
    $('#hands .card').removeClass('selected')
    $.post '/hands/select', { id: $(@).data('id') }, (data) =>
      $(@).addClass('selected')
