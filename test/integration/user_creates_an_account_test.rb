require 'test_helper'

class UserCreatesAnAccountTest < ActionDispatch::IntegrationTest
  test "user can create and account" do

    user_info = {first_name: "john",
                 last_name: "dinosaur",
                 email: "fake@gmail.com",
                 city: "Denver",
                 state: "CO",
                 zipcode: "80123",
                 password: "password",
               }

    visit '/login'

    click_on "Create Account"

    fill_in "First_name", with: user_info[:first_name]
    fill_in "Last_name", with: user_info[:last_name]
    fill_in "Password", with: user_info[:password]
    fill_in "Email", with: user_info[:email]
    fill_in "City", with: user_info[:city]
    fill_in "State", with: user_info[:state]
    fill_in "Zipcode", with: user_info[:zipcode]


    click_on "Create Account"

    assert "/dashboard", current_path
    # save_and_open_page
    assert page.has_content?("Logged in as john dinosaur")
    assert page.has_content?("fake@gmail.com")
    assert page.has_content?("Denver")
    assert page.has_content?("CO")
    assert page.has_content?("80123")

    refute page.has_link?("Login")

    assert page.has_link?("Logout")

    click_on "Logout"

    assert page.has_link?("Login")
  end
end
