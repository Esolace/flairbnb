class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accomodate
      t.integer :bed_room
      t.integer :bathroom
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :has_wifi
      t.boolean :has_tv
      t.boolean :has_closet
      t.boolean :has_shampoo
      t.boolean :has_breakfast
      t.boolean :has_heating
      t.boolean :has_aircon
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
