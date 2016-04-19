require 'rails_helper'

describe Card do
  it { should validate_uniqueness_of(:text) }
end
