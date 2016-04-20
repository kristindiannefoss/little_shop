require 'test_helper'

class UserCanAdjustQuantityInCartTest < ActionDispatch::IntegrationTest

  test "test user can adjust item quantity when items are already in cart" do
    create_categories
    create_items
    item = Item.first

    visit '/items'

    within ".navbar" do
      assert page.has_content? "Cart"
      assert page.has_content? "0"
    end

    click_button "Add to Cart"

    assert page.has_content? "Successfully added to cart!"

    within ".navbar" do
      assert page.has_content? "Cart"
      assert page.has_content? "1"
    end
    visit '/cart'

    assert_equal '/cart', current_path
    assert page.has_content? "#{item.name}"

    assert_equal "1", page.find_field("Quantity").value

    fill_in "Quantity", with: "2"
    click_button "Update Cart"

    assert_equal '/cart', current_path

    assert page.has_content? "#{item.name}"
    assert_equal "2", page.find_field("Quantity").value
    assert page.has_content? "Subtotal: $#{item.price * 2}"
    assert page.has_content? "Total: $#{item.price * 2}"
    # assert page.has_content? "Successfully added to cart!"
    # assert page.has_content? "Cart: 1"

  end

  # Background: My cart has an item in it
  #     As a visitor
  #     When I visit "/cart"
  #     Then I should see my item with a quantity of 1
  #     And when I increase the quantity
  #     Then my current page should be '/cart'
  #     And that item's quantity should reflect the increase
  #     And the subtotal for that item should increase
  #     And the total for the cart should match that increase


  #     And when I decrease the quantity
  #     Then my current page should be '/cart'
  #     And that item's quantity should reflect the decrease
  #     And the subtotal for that item should decrease
  #     And the total for the cart should match that decrease
  #     make sure you cannot have a negative number for quantity
end
