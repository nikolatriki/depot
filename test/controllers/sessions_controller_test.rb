require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login page" do
    get login_url
    assert_response :success
  end

  test "should login" do
    user = users(:one)
    post login_url, params: { name: user.name, password: "secret" }
    assert_redirected_to admin_index_url
    assert_equal user.id, session[:user_id]
  end

  test "should fail login" do
    user = users(:one)
    post login_url, params: { name: user.name, password: "wrong" }
    assert_redirected_to login_url
  end

  test "should log off user" do
    delete logout_url
    assert_redirected_to store_index_url
  end
end
