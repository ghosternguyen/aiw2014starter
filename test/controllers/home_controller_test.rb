require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get news" do
    get :news
    assert_response :success
  end

end
