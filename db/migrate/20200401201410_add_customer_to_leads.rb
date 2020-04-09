class AddCustomerToLeads < ActiveRecord::Migration[5.2]
  def change
    add_reference :leads, :customer, foreign_key: true, optional: true
  end
end
