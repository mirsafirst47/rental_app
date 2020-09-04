class Broker < ApplicationRecord
    has_many :apartments
    has_many :neighborhoods, through: :apartments
end
