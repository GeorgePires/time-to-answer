# frozen_string_literal: true

module Home
  class AnswerController < HomeController
    def verify_answer
      puts "====== #{params[:answer]}"
    end
  end
end
