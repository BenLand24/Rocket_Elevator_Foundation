class Elevators < ActiveRecord::Migration[5.2]
  def self.up
    create_table :elevators do |t|
      t.bigint :serial_number, :null => false
      t.string :model, :null => false
      t.string :elevator_type, :null => false
      t.string :status, :null => false
      t.date :date_commision, :null => false
      t.date :date_last_inspect, :null => false
      t.string :certificate_inspect, :null => false
      t.text :info
      t.text :notes

      t.timestamps
    end
 end
end
