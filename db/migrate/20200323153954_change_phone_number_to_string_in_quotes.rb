class ChangePhoneNumberToStringInQuotes < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :Phone_Number, :string
  end
end
