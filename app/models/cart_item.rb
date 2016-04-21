class CartItem
  attr_reader :item, :quantity

  def initialize(id, qty)
    @item = Item.find(id)
    @quantity = qty
  end

  def subtotal
    item.price * quantity
  end
end
