require 'rails_helper'

describe "Player Admin", type: :feature, js: true do
  let(:password) { Faker::Internet.password }
  let(:player) { create :player, password: password, password_confirmation: password }

  before do
    login_as player
    visit rails_admin.dashboard_path
    page.find('[data-model=player] a').click
  end

  it "has list page with fields" do
    expect(page).to have_text "List of Players"
    expect(page).to have_text "Name"
    expect(page).to have_text "Email"
    expect(page).to have_text "Created at"
    expect(page).to have_text "Updated at"
  end
end
