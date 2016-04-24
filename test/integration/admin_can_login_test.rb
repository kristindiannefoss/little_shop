require 'test_helper'

class AdminCanLoginTest < ActionDispatch::IntegrationTest
  test "As an admin I login and see the dashboard" do
      admin = User.create(first_name: "Kris",
                          last_name: "Foss",
                          email: "kris.foss@gmail.com",
                          password: "password",
                          role: 1)
      visit login_path
      fill_in "E-Mail", with: admin.email
      fill_in "Password", with: "password"
      click_on "Log in"
save_and_open_page
      assert page.has_content?("Admin Dashboard")
  end

  test "a registered user cannot view admin dashboard" do
    create_user
    user = User.first

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/admin/dashboard"
    assert page.has_content?("NOT FOUND")
  end

  test "an unregistered user cannot view admin dashboard" do
    visit items_path

    visit "/admin/dashboard"
    assert page.has_content?("NOT FOUND")
  end

end
