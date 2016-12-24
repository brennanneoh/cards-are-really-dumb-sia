class PlayersController < ApplicationController
  def create
    @player = Player.new
  end
end
