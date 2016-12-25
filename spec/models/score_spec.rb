require 'rails_helper'

RSpec.describe Score, type: :model do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to :player }
end
