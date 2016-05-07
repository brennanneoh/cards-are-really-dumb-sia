require 'rails_helper'

describe Card do
  it { is_expected.to respond_to(:text) }
  it { should validate_uniqueness_of(:text) }
end
