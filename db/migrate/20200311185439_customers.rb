class Customers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :customers do |t|
      t.timestamp :customer_create_date, :null => false
      t.string :company_name, :null => false
      t.string :name_company_contact, :null => false
      t.string :company_phone
      t.string :contact_email, :null => false
      t.text  :company_desc
      t.string :full_name_STA, :null => false
      t.string :tech_authority_phone, :null => false
      t.string :tech_manager_email, :null => false

      t.timestamps
    end
 end
end
