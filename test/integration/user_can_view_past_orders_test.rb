require 'test_helper'

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "the user can view their past orders" do
    user = User.create(first_name: "Mark",
                last_name: "Miranda",
                email: "NotMark@notmarkmiranda.com",
                # address: "",
                city: "Denver",
                state: "Colorado",
                zipcode: "80219",
                password: "password")

    create_orders(2)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/orders'

    assert page.has_content?("Order Number: #{Order.first.id}")
    assert page.has_content?("Order Number: #{Order.last.id}")

    # Background: An existing user that has multiple orders
      # As an Authenticated User
      # When I visit "/orders"
      # Then I should see all orders belonging to me and no other orders
    assert true
  end
end
