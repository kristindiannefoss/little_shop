require 'test_helper'

class RemoveItemFromCartTest < ActionDispatch::IntegrationTest
  test "visitor can remove item from cart" do
    # Background: My cart has an item in it
    create_categories
    create_items
    item = Item.first
    visit '/items'
    click_button "Add to Cart"
    # As a visitor
    # When I visit "/cart"
    visit '/cart'
    # And I click link "Remove"
    click_link "Remove"
    # Then my current page should be "/cart"
    assert '/cart', current_path
    # And I should see a message styled in green

    # And the message should say "Successfully removed SOME_ITEM from your cart."
    assert page.has_content? "Successfully removed #{item.name}!"
    # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
    assert page.has_link? "#{item.name}"
    # And I should not see the item listed in cart
    within '.cart' do
      refute page.has_content? item.name
    end
  end
end
