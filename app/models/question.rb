# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions, counter_cache: true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Kaminari
  paginates_per 8

  scope :search_questions, lambda { |keyword, page|
                             includes(:answers, :subject)
                               .where('description ILIKE ?', "%#{keyword}%")
                               .page(page).per(4)
                           }

  scope :search_subjects, lambda { |subject_id, page|
                            includes(:answers, :subject)
                              .where(subject_id: subject_id)
                              .page(page).per(4)
                          }
end
