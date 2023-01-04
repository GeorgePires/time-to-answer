# frozen_string_literal: true

class Subject < ApplicationRecord
  # Kaminari
  paginates_per 8
  has_many :questions
end
