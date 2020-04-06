class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
   
    create_table :quotes do |t|

      t.string :Full_Name
      t.integer :Phone_Number
      t.string :Company_Name
      t.string :Email

      t.string :Building_Type
      t.string :Product_Grade
      t.integer :Nb_Appartement
      t.integer :Nb_Business
      t.integer :Nb_Company
      t.integer :Nb_Floor
      t.integer :Nb_Basement
      t.integer :Nb_Cage
      t.integer :Nb_Parking
      t.integer :Nb_OccupantPerFloor
      t.string :Nb_OperatingHour

      t.string  :Nb_Ele_Suggested
      t.string  :Price_Per_Ele
      t.string  :Subtotal
      t.string  :Install_Fee
      t.string  :Final_Price

      t.timestamps
  
      end
  end
end
