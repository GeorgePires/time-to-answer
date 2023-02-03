# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  def correct?
    @answer.correct ? "ACERTOU" : "ERROU"
  end
end
