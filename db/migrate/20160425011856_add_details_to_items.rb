class AddDetailsToItems < ActiveRecord::Migration
  def change
    remove_column :items, :price, :decimal
    add_column :items, :price, :decimal, precision: 5, scale: 2
  end
end
