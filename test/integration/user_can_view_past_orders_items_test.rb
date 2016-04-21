require 'test_helper'

class UserCanViewPastOrdersItemsTest < ActionDispatch::IntegrationTest
  test "the user can view their past orders items" do
    create_user
    user = User.first
    create_orders(1, user.id, "completed")
    # create_orders(1, user.id, "paid")
    # create_orders(1, user.id, "ordered")
    # create_orders(1, user.id, "cancelled")
    create_categories
    create_items
    OrderItem.create(order_id: Order.first.id, item_id: Item.first.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    # Background: An existing user that has one previous order
    #       As an authenticated user
    #       When I visit "/orders"
    visit '/orders'
    #       Then I should see my past order
    assert page.has_content?("Order Number: #{Order.first.id}")
    #       And I should see a link to view that order
    #view order link
    assert page.has_link?("View Order Details")
    #       And when I click that link
    click_link "View Order Details"
    #       Then I should see each item that was ordered
    assert page.has_content("Order Details:")
    assert page.has_content("#{order.items.first.name}")
    #       And I should see links to each item's show page
    assert page.has_link?("#{order.items.first.name}")
    #with the quantity and line-item subtotals
    assert page.has_content("Quantity: #{order.items.first.quantity}")
    assert page.has_content("Subtotal: #{order.subtotals}")
    #       And I should see the current status of the order (ordered, paid, cancelled, completed)
    assert page.has_content("ordered")
    assert page.has_content("paid")
    assert page.has_content("cancelled")
    assert page.has_content("completed")
    #       And I should see the total price for the order
    assert page.has_content("Order Total: #{order.total_price}")
    #       And I should see the date/time that the order was submitted
    assert page.has_content("Order Date: #{order.created_at}")
    #       If the order was completed or cancelled
    assert page.has_content("Order Status#{order.order_status}")
    #       Then I should see a timestamp when the action took place
    assert page.has_content("#{order.updated_at}")
    #
  end
end
