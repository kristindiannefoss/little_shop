class RemoveRetiredFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :retired, :boolean
    add_column :items, :retired, :integer, default: 0
  end
end
