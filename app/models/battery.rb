class Battery < ApplicationRecord
    has_many :columns
    belongs_to :building
end
