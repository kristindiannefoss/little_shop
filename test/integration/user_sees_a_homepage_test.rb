require 'test_helper'

class UserSeesAHomepageTest < ActionDispatch::IntegrationTest
  test "user visits the root and sees a home page" do
    visit root_path

    assert page.has_content? "Welcome to NachomomsPaleo"
    assert page.has_content? "View Items"
    assert page.has_content? "Login"
  end
end
