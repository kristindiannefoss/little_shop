module CartItemsHelper
  def total_price(cart)
    cart.map do |item, quantity|
      item.price * quantity
    end.reduce(:+)
  end

  def format_price(number)
    number_to_currency(number)
  end
end
