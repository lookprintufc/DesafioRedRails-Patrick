class AddCamposToPlace < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :category, foreign_key: true
    add_column :places, :views, :integer, default: 0
  end
end
