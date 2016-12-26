require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:player) { create :player }

  before do
    sign_in player
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:stack) { create :stack }
    let(:players) { create_list :player, 3 }
    let(:params) {
      {
        game: {
          name: Faker::Book.unique.title,
          game_player_ids: players.map(&:id).map(&:to_s),
          stack_ids: [stack.id]
        }
      }
    }

    it "redirects to the created game when successful" do
      post :create, params: params
      expect(response).to redirect_to games_path(Game.first.id)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
