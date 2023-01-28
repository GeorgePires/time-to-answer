# frozen_string_literal: true

module Home
  class WelcomeController < HomeController
    def index
      @questions = Question.includes(:answers)
    end
  end
end
