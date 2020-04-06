class Batteries < ActiveRecord::Migration[5.2]
  def self.up
    create_table :batteries do |t|
      t.string :battery_type, :null => false
      t.string :status, :null => false
      t.date :date_commision, :null => false
      t.date :date_last_inspect, :null => false
      t.blob :certificate_operations, :null => false
      t.string :info
      t.string :notes

      t.timestamps
    end
 end
end
