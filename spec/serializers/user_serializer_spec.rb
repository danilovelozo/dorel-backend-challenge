# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UserSerializer do
  let(:user)  { create :user }

  describe '#as_json' do
    it 'serializes a user' do
      expect(described_class.new(user).serializable_hash).to eq(
        data: {
          id: "#{user.id}",
          type: :user,
          attributes: {
            email: user.email,
            generate_jwt: nil,
            id: user.id
          }
        }
      )
    end
  end
end
