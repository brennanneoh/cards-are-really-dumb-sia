class GamesController < ApplicationController
  before_action :authenticate_player!

  def new
    @players = Player.all
    @stacks = Stack.all
    @selected_stack = @stacks.select { |stack| stack.name == "Cards Against Humanity" }
  end

  def create
    @game = Game.new game_params
    if @game.save
      redirect_to games_path(@game)
    else
      # TODO: Error handling
    end
  end

  def show
  end

  private

  def game_params
    params.require(:game).permit(:name, game_player_ids: [], stack_ids: [])
  end
end
