require 'test_helper'

class SearchersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get searchers_index_url
    assert_response :success
  end

end
