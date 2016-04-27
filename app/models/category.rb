class Category < ActiveRecord::Base
has_many :items

validates :name,     presence: true, uniqueness: true
end
