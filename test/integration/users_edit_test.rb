require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:bela)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar",
                                              firstname: "Foo",
                                              lastname: "Bar",
                                              description: "Lorem ipsum" } }

    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    username  = "foobar"
    email = "foo@bar.com"
    firstname = "Foo"
    lastname = "Bar"
    description = "Lorem ipsum"
    patch user_path(@user), params: { user: { username:  username,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "",
                                              firstname: firstname,
                                              lastname: lastname,
                                              description: description } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal username,  @user.username
    assert_equal email, @user.email
  end
end