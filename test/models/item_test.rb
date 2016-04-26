require "test_helper"

class ItemTest < ActiveSupport::TestCase

  test "Correct item attributes" do
    item = Item.create(
    name: "Bronto Burgers",
    description: "Yum, meaty",
    image_url: "sample",
    price: 6.00)
    assert item.valid?
    assert "How do you test for the attributes in a model test??"
    #   - An item must have a title, description and price.
    # - An item must belong to at least one category.
    # - The title and description cannot be empty.
    # - The title must be unique for all items in the system.
    # - The price must be a valid decimal numeric value and greater than zero.
    # - The photo is optional.
    # - If not present, a stand-in photo is used. (PAPERCLIP)
  end
end
