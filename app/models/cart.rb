class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def mapped_values
    a = contents.map do |id, qty|
      CartItem.new(id.to_i, qty)
    end
  end
  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_all
    contents.values.sum
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def remove_item(item_id)
    contents.delete(item_id)
  end

  def update(item_id, qty)
    contents[item_id] = qty
  end

  def total_price
    if contents.empty?
      return 0
    else
      contents.map do |id, quantity|
        [Item.find(id.to_i), quantity]
      end.map do |item, quantity|
        item.price * quantity
      end.reduce(:+)
    end
  end

  def subtotal(item_id)
    count_of(item_id) * Item.find(item_id).price
  end
end
