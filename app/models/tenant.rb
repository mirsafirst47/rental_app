class Tenant < ApplicationRecord
    has_many :rental_applications
    has_many :apartments, through: :rental_applications
end
