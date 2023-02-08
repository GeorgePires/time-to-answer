# frozen_string_literal: true

module Home
  class AnswerController < HomeController
    def verify_answer
      @answer = Answer.find(params[:answer])
    end
  end
end
