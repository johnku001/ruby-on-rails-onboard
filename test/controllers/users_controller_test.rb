require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { first_: @user.first_, last_name: @user.last_name, name: @user.name } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get users_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch users_url(@user), params: { user: { first_name: @user.first_name, last_name: @user.last_name, age: @user.age,  region: @user.region } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete users_url(@user), as: :json
    end

    assert_response 204
  end
end
