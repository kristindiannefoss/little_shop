require 'test_helper'

class VisitorCanCheckoutTest < ActionDispatch::IntegrationTest
  test "visitor can checkout" do
    create_categories
    create_items
    user_info = {first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 email: Faker::Internet.safe_email,
                 address: Faker::Address.street_address,
                 city: Faker::Address.city,
                 state: Faker::Address.state_abbr,
                 zipcode: Faker::Address.zip_code,
                 password: "password"}

    visit '/items'
    click_button "Add to Cart"
    click_button "Add to Cart"

    visit '/cart'

    refute page.has_link?("Checkout", href: '/checkout')
    assert page.has_link?("Login")
    assert page.has_link?("Create Account to Checkout", href: new_user_path)

    click_on "Create Account"

    fill_in "First Name", with: user_info[:first_name]
    fill_in "Last Name", with: user_info[:last_name]
    fill_in "City", with: user_info[:city]
    fill_in "Street Address", with: user_info[:address]
    fill_in "State", with: user_info[:state]
    fill_in "Zip Code", with: user_info[:zipcode]
    fill_in "E-Mail", with: user_info[:email]
    fill_in "Password", with: user_info[:password]

    click_button "Create Account"

    visit '/cart'

    assert page.has_content?(Item.first.name)

    click_on "Logout"
    assert page.has_link?("Login")
    refute page.has_link?("Logout")
  end
end
