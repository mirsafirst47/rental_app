class Neighborhood < ApplicationRecord
    has_many :apartments
    has_many :brokers, through: :apartments
end
