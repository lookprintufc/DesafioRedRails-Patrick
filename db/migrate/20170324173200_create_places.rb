class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.references :place_type, foreign_key: true
      t.string :description
      t.integer :room_limit
      t.integer :bed_limit
      t.integer :accomodate_limit
      t.integer :bathroom_limit
      t.string   :address
      t.decimal  :price
      t.integer  :user_id
      t.string :photo
      t.timestamps
    end
  end
end
