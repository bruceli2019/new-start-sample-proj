require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "    " #app/models/user.rb has the validates(:name, presence: true)
    assert_not @user.valid? #@user.name is blank, which means @user.valid? = false
  end
  
  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end
  
  test "name not too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email not too long" do
    @user.email = "a" * 244 + "@example.com" #database max str len is 255, 244 + 12 = 256, @example.com is 12 char
    assert_not @user.valid?
  end
    
  
  
end
