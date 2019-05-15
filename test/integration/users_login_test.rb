require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "login with invalid information" do
    get login_path

    assert_template "sessions/new.html.erb"

    post login_path, params: { session: {email: "", password: ""}}

    assert_template "sessions/new.html.erb"

    #makes sure we get an error message
    assert_not flash.empty?

    get root_path

    #makes sure we do NOT get an error message
    assert flash.empty?
  end

end
