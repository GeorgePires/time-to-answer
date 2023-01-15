# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :questions, dependent: :destroy
  # Kaminari
  paginates_per 8
end
