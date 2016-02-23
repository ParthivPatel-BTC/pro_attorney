require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get view_users" do
    get :view_users
    assert_response :success
  end

  test "should get view_cases" do
    get :view_cases
    assert_response :success
  end

  test "should get view_case" do
    get :view_case
    assert_response :success
  end

end
