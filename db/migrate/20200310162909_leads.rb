class Leads < ActiveRecord::Migration[5.2]
  def self.up
    create_table :leads do |t|
       t.string :full_name, :null => false
       t.string :company_name
       t.string :email, :null => false
       t.string :phone
       t.string :project_name
       t.string :project_desc
       t.string :department, :null => false
       t.string :message, :null => false
       t.blob :attached_file
       t.timestamps
    end
 end
end
