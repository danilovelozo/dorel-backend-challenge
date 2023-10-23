# frozen_string_literal: true

class TaskSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :start_date, :end_date, :completed, :user_id
end
