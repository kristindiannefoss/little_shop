require 'test_helper'

class VisitorAddsItemsToCartTestTest < ActionDispatch::IntegrationTest
  test "visitor can add items to their cart from items index" do
    create_categories(2)
    create_items(4)

    # Background: Items, and a user that is not logged in
    # As a visitor
    # When I visit any page with an item on it
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    visit '/items'
    assert page.has_content? "Cart: 0"

    first(:button, "Add to Cart").click
    # save_and_open_page
    assert page.has_content? "Successfully added to cart!"

    assert page.has_content? "Cart: 1"



    # And I click a link or button to view cart
    # And my current path should be /cart

    # And I should see a small image, title, description and price for the item I just added
    # And there should be a total price for the cart that should be the sum of all items in the cart
  end
end
