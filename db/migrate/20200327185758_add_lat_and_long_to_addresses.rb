class AddLatAndLongToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :lat, :decimal, precision:15, scale: 10
    add_column :addresses, :long, :decimal, precision:15, scale: 10
  end
end
