require 'test_helper'

class VisitorSeesAllItemsTest < ActionDispatch::IntegrationTest
  test "visitor can see all items" do
    item1 = Item.create(
    name: "Tyrannosaurus Flank",
    description: "The best tyrannosaurus flank you've ever had!",
    image_url: "http://previews.123rf.com/images/neilld/neilld1301/neilld130100039/17588909-A-Tyrannosaurus-Rex-Hunts-Against-a-White-Background--Stock-Photo.jpg",
    price: 499.95)
    item2 = Item.create(
    name: "Stegasaurus Eggs",
    description: "Super young, non-developed Stegasaurus Eggs!",
    image_url: "http://kidsquare.com/cdimages/x3262.jpg",
    price: 1499.95)

    visit '/items'

    assert page.has_content? "All Items"
    assert page.has_content? "Tyrannosaurus Flank"
    assert page.has_content? "Stegasaurus Eggs"

  end
end
