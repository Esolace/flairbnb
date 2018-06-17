class AddHasKitchenToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :has_kitchen, :boolean
  end
end
