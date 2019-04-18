require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "layout links" do
    get root_path #everything below tests for stuff in root page
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path, count: 2 #tests for presence of 2 root_paths
    assert_select "a[href=?]", help_path #tests for presence of help_path in a link tag
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    
    get contact_path #everything below tests for stuff in contact page
    assert_select "title", full_title("Contact") #full_title function in app/helpers/application_helper.rb
    
    get signup_path #everything below tests for stuff on signup page
    assert_select "title", full_title("Sign Up")
    
  end
  
end
