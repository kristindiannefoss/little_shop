require 'test_helper'

class ItemPresenterTest << ActiveSupport::TestCase

  def setup
    create_item(1, true)
    @item = Item.first

    @retired = ItemPresenter.new(@item)
  end

  test "retired item returns retired button" do
    assert_equal 
  end

end
