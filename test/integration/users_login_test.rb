require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:bela)
  end

  test "login with invalid information" do
    get bejelentkezes_path
    assert_template 'session/new'
    post bejelentkezes_path, params: { session: { email: "", password: "" } }
    assert_template 'session/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get bejelentkezes_path
    post bejelentkezes_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", bejelentkezes_path, count: 0
    assert_select "a[href=?]", kijelentkezes_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with valid information followed by logout" do
    get bejelentkezes_path
    post bejelentkezes_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", bejelentkezes_path, count: 0
    assert_select "a[href=?]", kijelentkezes_path
    assert_select "a[href=?]", user_path(@user)
    delete kijelentkezes_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", bejelentkezes_path
    assert_select "a[href=?]", kijelentkezes_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end