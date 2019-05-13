require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: {user: {
                                        name: "",
                                        email: "invalid@email",
                                        password: "bar",
                                        password_confirmation: "baz",
                                      }
                                }
    end
      assert_template "users/new"
      #below code returns true if we fail tests -- should get error fields, explanations, alerts
      assert_select 'div.field_with_errors'
      assert_select 'div.error_explanation'
      assert_select 'div.alert-danger'
      #makes sure that invalid signup means we tried to submit already, which goes through post
      assert_select 'form[action="/signup"]'
  end

  test "valid signup information" do
    get signup_path

    assert_difference 'User.count', 1 do
      post users_path, params: {user: {
                                        name: "John Cena",
                                        email: "johncena@gmail.com",
                                        password: "johncena1",
                                        password_confirmation: "johncena1"
                                        }
                                }
    end

    follow_redirect!
    assert_template 'users/show'
    assert_select 'div.alert-success' #see table 5.2 in Rails Tutorial and 7.4.2
    assert_not flash.nil?
  end

end
