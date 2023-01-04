# frozen_string_literal: true

require 'test_helper'

module AdminsBackoffice
  class QuestionsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admins_backoffice_questions_index_url
      assert_response :success
    end
  end
end
