class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.date :at
      t.integer :lunch
      t.integer :dinner

      t.timestamps
    end
  end
end
