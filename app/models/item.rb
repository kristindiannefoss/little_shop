class Item < ActiveRecord::Base
  belongs_to :category

  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates_numericality_of :price,  greater_than: 0

  # validate :price_has_to_be_greater_than_minimum
  #
  # def price_has_to_be_greater_than_minimum
  #   errors.add
  # end

  def disabled_item?
    retired ? ["Item Retired", disabled: true] : ["Add to Cart", disabled: false]
  end

end
