class SuitsController < ApplicationController
  def random
    ActionCable.server.broadcast 'random_suit_channel', render(partial: 'cards/suit', locals: Card.pick_random_suit)
    head :ok
  end
end
