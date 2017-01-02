class RoundsController < ApplicationController
  def current
    round = Round.current_for params[:game_id]
    render partial: 'rounds/current', locals: { round: round }
  end
end
