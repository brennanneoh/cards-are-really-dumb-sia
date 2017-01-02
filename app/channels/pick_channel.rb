class PickChannel < ApplicationCable::Channel
  def subscribed
    stream_from "pick_channel_#{params[:game_id]}"
  end

  def select data
    hand = Hand.find data['hand_id']
    hand.reset_player_pick data['player_id']
    hand.player_pick = true
    if hand.save
      RenderPicksJob.perform hand
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
