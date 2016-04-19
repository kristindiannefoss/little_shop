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
end
