require 'test_helper'

class VisitorCanViewCartTest < ActionDispatch::IntegrationTest
  test "visitor can view items in cart" do

    create_categories
    item = Item.create(name: "Dino Snackies",
      description: "Better than goldfish",
      image_url: "http://ecommerce.wiosid.com/uploads/user/StegglesChickenNuggetsDinoSnacks02.jpg",
      price: 10.00,
      category_id: Category.first.id )

    visit '/items'
    click_button "Add to Cart"
    click_button "Add to Cart"
    click_link "View My Cart"
    assert_equal '/cart', current_path

    expected = "http://ecommerce.wiosid.com/uploads/user/StegglesChickenNuggetsDinoSnacks02.jpg"
    assert_equal expected, item.image_url

    assert page.has_content? "Dino Snackies"
    assert page.has_content? "Better than goldfish"
    assert page.has_content? "$10.00"
    assert page.has_content? "Quantity: 2"


    assert page.has_content? "Total: $20.00"

    # And I click a link or button to view cart
    # And my current path should be /cart

    # And I should see a small image, title, description and price
    #for the item I just added
    # And there should be a total price for the cart that should be
    #the sum of all items in the cart

    assert true
  end
end
