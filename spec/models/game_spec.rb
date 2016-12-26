require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to have_many(:rounds) }
  it { is_expected.to have_many(:scores) }
  it { is_expected.to have_many(:players).through(:scores) }
  it { is_expected.to belong_to(:stack) }
end
