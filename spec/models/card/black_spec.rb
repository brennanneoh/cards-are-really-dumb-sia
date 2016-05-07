require 'rails_helper'

describe Card::Black do
  it { is_expected.to respond_to(:question) }
  it { is_expected.to respond_to(:fill_in_the_blank) }
end
