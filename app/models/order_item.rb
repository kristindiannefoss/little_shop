class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def subtotal
    quantity * item.price
  end
end
