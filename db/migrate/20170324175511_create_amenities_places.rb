class CreateAmenitiesPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities_places do |t|
      t.references :place, foreign_key: true
      t.references :amenitie, foreign_key: true

      t.timestamps
    end
  end
end
