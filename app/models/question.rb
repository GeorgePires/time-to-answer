# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :subject
  # Kaminari
  paginates_per 8
end
