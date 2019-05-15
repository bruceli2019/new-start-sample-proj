require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    # :bruce in test/fixtures/users.yml
    @user = users(:bruce)
  end

  test "login with valid information" do
    get login_path

    post login_path, params: { session: {email: @user.email, password: 'password'}}

    assert_redirected_to user_path(@user)

    follow_redirect!

    assert_template "users/show"

    assert_select "a[href=?]", login_path, count = 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

  end

  test "login with invalid information" do
    get login_path

    assert_template "sessions/new" #ok so in Listing 8.9 this is sessions/new

    post login_path, params: { session: {email: "", password: ""}}

    #this is sessions/new as well in Listing 8.9, but for some reason my tests
    #fail if I do sessions/new instead of sessions/new.html.erb ?
    assert_template "sessions/new.html.erb"

    #makes sure we get an error message
    assert_not flash.empty?

    get root_path

    #makes sure we do NOT get an error message
    assert flash.empty?
  end

end
