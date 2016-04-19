require 'test_helper'

class VisitorCanBrowseByCategoryTest < ActionDispatch::IntegrationTest
  test "visitor sees all items assigned to a category" do
    category1 = Category.create(name: "meats")
    category2 = Category.create(name: "eggs")


    items = Item.create([{
    name: "Tyrannosaurus Flank",
    description: "The best tyrannosaurus flank you've ever had!",
    image_url: "http://previews.123rf.com/images/neilld/neilld1301/neilld130100039/17588909-A-Tyrannosaurus-Rex-Hunts-Against-a-White-Background--Stock-Photo.jpg",
    price: 499.95,
    category_id: category1.id},
    {name: "Stegasaurus Eggs",
    description: "Super young, non-developed Stegasaurus Eggs!",
    image_url: "http://kidsquare.com/cdimages/x3262.jpg",
    price: 1499.95,
    category_id: category2.id},
    {name: "Brontosaurus Wings",
    description: "Brontosaurus wings cures cancer!",
    image_url: "http://previews.123rf.com/images/neilld/neilld1301/neilld130100039/17588909-A-Tyrannosaurus-Rex-Hunts-Against-a-White-Background--Stock-Photo.jpg",
    price: 299.95,
    category_id: category1.id},
    {name: "Triceratops Eggs",
    description: "Better than the Stegasaurus Eggs!",
    image_url: "http://kidsquare.com/cdimages/x3262.jpg",
    price: 2499.95,
    category_id: category2.id}])

    visit '/meats'

    within(".meats") do
      assert page.has_content?("Tyrannosaurus Flank")
      assert page.has_content?("Brontosaurus Wings")
    end

    visit '/eggs'

    within(".eggs") do
      assert page.has_content?("Stegasaurus Eggs")
      assert page.has_content?("Triceratops Eggs")
    end
  end
end
