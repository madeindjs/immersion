require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:me)
  end

  test "create newsletter" do
    assert_difference('Newsletter.count') do
      user = User.create email: 'test@test.fr', firstname: @user.firstname, lastname: @user.lastname, password: 20462046, password_confirmation: 20462046
    end
  end

end
