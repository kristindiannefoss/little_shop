class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  # def before_create(order)
  #   byebug
  # end

  def subtotal
    quantity * item.price
  end
end
