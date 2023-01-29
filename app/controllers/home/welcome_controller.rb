# frozen_string_literal: true

module Home
  class WelcomeController < HomeController
    def index
      @q = Question.ransack(params[:q])
      @questions = @q.result.includes(:answers).page(params[:page]).per(4)
    end
  end
end
