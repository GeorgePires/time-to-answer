# frozen_string_literal: true

require 'test_helper'

module AdminsBackoffice
  class AdminsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admins_backoffice_admins_index_url
      assert_response :success
    end
  end
end
