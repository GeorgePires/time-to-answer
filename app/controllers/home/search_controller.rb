# frozen_string_literal: true

module Home
  class SearchController < HomeController
    def questions
      @questions = Question.search_questions(params[:keyword], params[:page])
    end

    def subject
      @questions = Question.search_subjects(params[:subject_id], params[:page])
    end
  end
end
