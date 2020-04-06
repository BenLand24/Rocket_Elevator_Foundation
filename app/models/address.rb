class Address < ApplicationRecord
    has_many :buildings
    has_many :customers
end
