require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to have_many(:rounds) }
  it { is_expected.to have_many(:scores) }
  it { is_expected.to have_many(:players).through(:scores) }
  it { is_expected.to have_and_belong_to_many(:stacks) }
end
