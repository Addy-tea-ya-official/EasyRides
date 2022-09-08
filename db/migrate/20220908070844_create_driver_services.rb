class CreateDriverServices < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_services do |t|
      t.references :driver, index: true, foreign_key: { to_table: :users }
      t.references :vehicle, index: true, foreign_key: true
      t.string :destination, :null => false
      t.integer :current_capacity, :null => false
      t.integer :fair
      t.time :boarding_time
      t.timestamps
    end
  end
end
