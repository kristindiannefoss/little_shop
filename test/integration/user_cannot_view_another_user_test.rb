require 'test_helper'

class UserCannotViewAnotherUserTest < ActionDispatch::IntegrationTest
  test "authenticated user cannot view another user" do
    # Background: An authenticated user and the ability to add an admin user
    # As an Authenticated User
    create_user(2)
    user_1 = User.first
    user_2 = User.last
    ApplicationController.any_instance.stubs(:current_user).returns(user_1)

    visit '/dashboard/2'
    assert page.has_content? "NOT FOUND"
    visit '/user/2'
    assert page.has_content? "NOT FOUND"
    # render file: "/public/404" unless current_admin?
    # I cannot view another user's private data (current or past orders, etc)
    # I cannot view the administrator screens or use admin functionality
    # I cannot make myself an admin
  end


end
