# frozen_string_literal: true

class Subject < ApplicationRecord
  # Kaminari
  paginates_per 10
  has_many :questions
end
