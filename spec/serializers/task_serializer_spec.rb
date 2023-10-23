# frozen_string_literal: true

require "spec_helper"

RSpec.describe TaskSerializer do
  let(:user) { create :user }
  let(:task) { create :task, user: user }

  describe "#as_json" do
    it "serializes a task" do
      expect(described_class.new(task).serializable_hash).to eq(
        data: {
          id: task.id.to_s,
          type: :task,
          attributes: {
            title: task.title.to_s,
            description: task.description.to_s,
            start_date: nil,
            end_date: nil,
            completed: nil,
            user_id: user.id
          }
        }
      )
    end
  end
end
