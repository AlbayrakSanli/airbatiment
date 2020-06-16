class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.references :house, index: true
      t.references :appointment, index: true
      t.integer :duration, default: 120
      t.datetime :date_start
      t.timestamps
    end
  end
end
