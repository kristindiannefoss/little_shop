require 'test_helper'

class VisitorCanCheckoutTest < ActionDispatch::IntegrationTest
  test "visitor can checkout" do
    create_categories
    create_items
    user_info = {first_name: "john",
                 last_name: "dinosaur",
                 email: "fake@gmail.com",
                 city: "Denver",
                 state: "CO",
                 zipcode: "80123",
                 password: "password",
               }

    visit '/items'
    click_button "Add to Cart"
    click_button "Add to Cart"

    visit '/cart'

    refute page.has_link?("Checkout", href: '/checkout')
    assert page.has_link?("Login")
    assert page.has_link?("Create Account to Checkout", href: new_user_path)

    click_on "Create Account"

    fill_in "First_name", with: user_info[:first_name]
    fill_in "Last_name", with: user_info[:last_name]
    fill_in "Password", with: user_info[:password]
    fill_in "Email", with: user_info[:email]
    fill_in "City", with: user_info[:city]
    fill_in "State", with: user_info[:state]
    fill_in "Zipcode", with: user_info[:zipcode]

    click_button "Create Account"

    visit '/cart'

    assert page.has_content?(Item.first.name)

    click_on "Logout"

    assert page.has_link?("Login")
    refute page.has_link?("Logout")
  end
end
