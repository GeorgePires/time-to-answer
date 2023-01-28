# frozen_string_literal: true

module Home
  class WelcomeController < HomeController
    def index
      @questions = Question.includes(:answers).page(params[:page]).per(4)
    end
  end
end
