class SuitsController < ApplicationController
  def random_suit
    ActionCable.server.broadcast 'suit_channel', render(partial: 'cards/suit', locals: Card.random_suit)
  end
end
