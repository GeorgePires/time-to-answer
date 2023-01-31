# frozen_string_literal: true

module Home
  class SearchController < HomeController
    def questions
      @questions = Question.search_questions(params[:keyword], params[:page])
    end
  end
end
