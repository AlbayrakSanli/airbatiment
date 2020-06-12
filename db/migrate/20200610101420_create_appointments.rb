class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :house, foreign_key: true
      t.integer :duration, default: 120
      t.datetime :date_start

      t.timestamps
    end
  end
end
