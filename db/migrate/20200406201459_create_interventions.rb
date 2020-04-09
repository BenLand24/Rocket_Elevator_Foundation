class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author_id
      t.references :customer, foreign_key: true
      t.references :building, foreign_key: true
      t.references :battery, foreign_key: true
      t.references :column, foreign_key: true
      t.references :elevator, foreign_key: true
      t.references :employee, foreign_key: true
      t.datetime :interventionStartTime
      t.datetime :interventionEndTime
      t.string :result
      t.string :report
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end
