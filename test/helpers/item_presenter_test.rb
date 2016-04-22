require 'test_helper'

class ItemPresenterTest < ActiveSupport::TestCase

  def setup
    create_categories
    create_items(1, 1)
    @item = Item.first
byebug
    @retired_item = ItemPresenter.new(@item)
  end

  test "retired item returns retired button" do
    expected = "<%= button_to \"Item Retired\",
            cart_items_path(item_id: @item.id),
            disabled: true %>"
    assert_equal expected, @retired_item.button_type
  end

end
