require 'spec_helper'

describe Player do
  describe 'Validations' do

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

    let(:no_password_player) { Player.new password: nil, password_confirmation: nil }
    it 'should not be vaild without a password' do
      expect(no_password_player).to_not be_valid
    end
  end
end
