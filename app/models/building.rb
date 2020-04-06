class Building < ApplicationRecord
    has_many :batteries
    has_many :building_details
    belongs_to :address
    belongs_to :customer
end
