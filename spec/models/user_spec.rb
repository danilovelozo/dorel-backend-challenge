require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    context 'when the email is formatted correctly' do
      it { is_expected.to allow_value("velozo.dan@gmail.com").for(:email) }
    end

    context 'when an email is formatted incorrectly' do
      it { is_expected.not_to allow_value("xpto@sss").for(:email) }
    end
  end
end