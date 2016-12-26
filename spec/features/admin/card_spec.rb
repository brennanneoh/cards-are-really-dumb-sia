require 'rails_helper'

describe "Card Admin", type: :feature, js: true do
  let(:player) { create :player }

  before do
    login_as player
    visit rails_admin.dashboard_path
    page.find('[data-model=card] a').click
  end

  it "has list page with fields" do
    expect(page).to have_text "List of Cards"
    expect(page).to have_text "Text"
    expect(page).to have_text "Created at"
    expect(page).to have_text "Updated at"
    expect(page).to have_text "Type"
    expect(page).to have_text "Text type"
  end
end
