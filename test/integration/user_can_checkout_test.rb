require 'test_helper'

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  test "checking out creates an order and order items" do
    create_categories
    create_items
    create_user
    visit "/items"
    click_on "Add to Cart"

    within ".navbar" do
      click_on "Cart"
    end

    click_on "Login"
    fill_in "E-Mail", with: User.first.email
    fill_in "Password", with: "password"
    click_on "Log in"
    assert_equal "/cart", current_path
    click_on "Checkout"
    assert_equal "/orders", current_path
    assert page.has_content? "Order was successfully placed"
    order = Order.first
    assert page.has_content? "Order Number: #{order.id}"
  end
end
