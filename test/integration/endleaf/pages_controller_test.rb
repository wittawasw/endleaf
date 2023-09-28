# test/integration/endleaf/pages_controller_test.rb
require 'test_helper'

module Endleaf
  class PagesControllerTest < ActionDispatch::IntegrationTest
    test "should get show: test page" do
      get endleaf_pages_page_url('test')
      assert_response :success
    end

    # Add more test cases for other actions as needed
  end
end
