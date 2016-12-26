require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to have_many(:scores) }
  it { is_expected.to have_many(:games).through(:scores) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
end
