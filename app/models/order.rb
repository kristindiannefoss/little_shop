class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates :user_id, presence: true

  # before_create OrderItem.new(@cart.contents)

  def total_price
    order_items.map{ |oi| oi.subtotal }.sum
  end
end
