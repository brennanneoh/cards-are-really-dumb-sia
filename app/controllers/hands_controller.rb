class HandsController < ApplicationController
  def select
    hand = Hand.find params[:id]
    hand.reset_player_pick current_player.id
    hand.player_pick = true
    hand.save

    ActionCable.server.broadcast "pick_channel_#{hand.round.game.id}", render(partial: 'hands/picks', locals: { hands: Hand.picks_for(hand.round_id) })

    head :ok
  end
end
