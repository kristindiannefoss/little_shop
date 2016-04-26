class CartItem < SimpleDelegator
  attr_reader :item, :quantity

  def initialize(id, qty)
    @item = Item.find(id)
    @quantity = qty
    super(@item)
  end

  def subtotal
    item.price * quantity
  end
end
