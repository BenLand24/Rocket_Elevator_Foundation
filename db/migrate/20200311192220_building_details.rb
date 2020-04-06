class BuildingDetails < ActiveRecord::Migration[5.2]
  def self.up
    create_table :building_details do |t|
      t.string :info_key, :null => false
      t.string :value, :null => false
    end
 end
end
