require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get attempt_login" do
    get :attempt_login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
