class CreateServiceTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :service_tickets do |t|
      t.references :driver_service, foreign_key: true
      t.references :passenger, index: true, foreign_key: { to_table: :users }
      t.boolean :request_status, default: false
      t.timestamps
    end
  end
end
