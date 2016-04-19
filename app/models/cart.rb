class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
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

end
