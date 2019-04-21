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
    
  test "email validation should accept valid addresses" do
    #list some valid addresses to make sure the validation isn't screwing up
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid" #.inspect returns a literal representation of the object it's called on
    end
  end
  
  test "email validation should not accept invalid addresses" do
    #list some invalid addresses
    invalid_addresses = %w[user@example,com user_at_foo.org user@example..com user.name@example. foo@bar_baz.com foo@bar+baz.com]
  
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid" #assert_not returns true when @user.valid? returns false (i.e. user is invalid)
    end
  end
  
end
