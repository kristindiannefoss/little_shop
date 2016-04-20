require 'test_helper'

class VisitorAddsItemsToCartTestTest < ActionDispatch::IntegrationTest
  test "visitor can add items to their cart from items index" do
    create_categories(2)
    create_items(4)

    visit '/items'
    
    within ".navbar" do
      assert page.has_content? "Cart"
      assert page.has_content? "0"
    end
    first(:button, "Add to Cart").click

    assert page.has_content? "Successfully added to cart!"

    within ".navbar" do
      assert page.has_content? "Cart"
      assert page.has_content? "1"
    end
  end
end
