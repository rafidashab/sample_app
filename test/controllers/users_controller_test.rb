require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  #auto generated test just checks if the view file is generated
  test "should get new" do
    get signup_path
    assert_response :success
  end
end
