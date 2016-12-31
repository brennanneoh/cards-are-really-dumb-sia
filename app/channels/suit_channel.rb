class SuitChannel < ApplicationCable::Channel
  def subscribed
    stream_from "suit_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
