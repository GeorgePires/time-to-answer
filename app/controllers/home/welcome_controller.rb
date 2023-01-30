# frozen_string_literal: true

module Home
  class WelcomeController < HomeController
    def index
      @search = Question.ransack(params[:q])
      @questions = @search.result.includes(:answers).page(params[:page]).per(3)
    end

    def search
      index
      render :index
    end
  end
end
