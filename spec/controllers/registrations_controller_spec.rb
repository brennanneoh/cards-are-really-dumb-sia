require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:player]
  end

  describe "sign up" do
    subject { post :create, params: params }
    let(:params) {
      { player:
        {
          email: 'test@domain.com',
          name: 'Tester',
          password: 'P@ssw0rd',
          password_confirmation: 'P@ssw0rd'
        }
      }
    }

    it "should accept the additional `name` parameter" do
      expect(subject).to redirect_to games_path
    end
  end
end
