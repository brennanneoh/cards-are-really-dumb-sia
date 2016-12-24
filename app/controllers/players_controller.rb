class PlayersController < ApplicationController
  def signup
    @player = Player.new
  end

  def create
    @player = Player.new params.require(:player).permit(:name, :email, :password, :password_confirmation)
    if @player.save
      flash.now[:notice] = 'An email confirmation has been sent'
    else
      flash.now[:error] = 'There is an error'
    end

    redirect_to :signup
  end
end
