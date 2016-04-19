require 'test_helper'

class VisitorAddsItemsToCartTestTest < ActionDispatch::IntegrationTest
  test "visitor can add items to their cart from items index" do
    create_categories(2)
    create_items(4)

    visit '/items'
    assert page.has_content? "Cart: 0"
    first(:button, "Add to Cart").click

    assert page.has_content? "Successfully added to cart!"
    assert page.has_content? "Cart: 1"
  end
end
