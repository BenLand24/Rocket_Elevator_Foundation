class Addresses < ActiveRecord::Migration[5.2]
  def self.up
    create_table :addresses do |t|
      t.string :type_of_address, :null => false
      t.string :status, :null => false
      t.string :entity, :null => false
      t.string :number_n_street, :null => false
      t.string :suite_or_apt, :default => ""
      t.string :city, :null => false
      t.string :postal_code, :null => false
      t.string :country, :null => false
      t.text :notes
    end
 end
end
