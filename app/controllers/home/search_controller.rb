# frozen_string_literal: true

module Home
  class SearchController < HomeController
    def questions
      @questions = Question.all
    end
  end
end
