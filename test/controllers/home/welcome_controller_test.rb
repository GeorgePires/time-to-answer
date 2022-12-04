# frozen_string_literal: true

require 'test_helper'

module Home
  class WelcomeControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get home_welcome_index_url
      assert_response :success
    end
  end
end
