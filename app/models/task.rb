# frozen_string_literal: true

class Task < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  validates :title, presence: true, uniqueness: {scope: :user}

  belongs_to :user
end
