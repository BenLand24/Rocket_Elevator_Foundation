class Intervention < ApplicationRecord
    belongs_to :author, class_name: "Employee", optional: true
    belongs_to :customer
    belongs_to :building
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true
    belongs_to :employee, optional: true
  end
  