class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.integer :price_house
      t.integer :price_visit
      t.integer :area
      t.integer :room
      t.references :owner, index: true

      t.timestamps
    end
  end
end
