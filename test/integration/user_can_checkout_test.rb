require 'test_helper'

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  test "" do
    #     As a visitor
    create_categories
    create_items
    create_user
    #     When I add items to my cart
    visit "/items"
    click_on "Add to Cart"
    within ".navbar" do
      click_on "Cart"
    end
    #     And I visit "/cart"
    click_on "Login"
    #     And I click "Login or Register to Checkout"
    #     Then I should be required to login or complete registration
    fill_in "E-Mail", with: User.first.email
    fill_in "Password", with: "password"
    click_on "Log in"
    # save_and_open_page
    #     When I am logged in I should be taken back to my cart
    assert_equal "/cart", current_path
    #     And when I click "Checkout"
    click_on "Checkout"
    #     Then the order should be placed
    #     And my current page should be "/orders"
    assert_equal "/orders", current_path
    #     And I should see a message "Order was successfully placed"
    assert page.has_content? "Order was successfully placed"
    #     And I should see the order I just placed in a table
    order = Order.first
    item = order.items.first
    assert page.has_content? order.id
    assert page.has_content? order.created_at
    # assert page.has_content? order.status
    assert page.has_content? "Order Status: ordered"
    assert page.has_link? item.name
    assert page.has_content? item.quantity
    assert page.has_content? item.price
    assert page.has_content? item.subtotal
    assert page.has_content? order.total_price

  end
end
