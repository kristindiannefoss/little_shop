class Item < ActiveRecord::Base
  belongs_to :category

  def disabled_item?
    @retired = ["Item Retired", disabled: true]
    @normal = ["Add to Cart", disabled: false]
    retired ? @retired : @normal
  end
end
