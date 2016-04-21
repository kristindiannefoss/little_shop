class Item < ActiveRecord::Base
  belongs_to :category

  has_many :order_items
  has_many :orders, through: :order_items


  def disabled_item?
    retired ? ["Item Retired", disabled: true] : ["Add to Cart", disabled: false]
  end

end
