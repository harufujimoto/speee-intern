# frozen_string_literal: true

require 'test_helper'

class EvaluationRequestsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get evaluation_requests_new_url
    assert_response :success
  end
end
