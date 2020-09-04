class Apartment < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :broker
  has_many :rental_applications
  has_many :tenants, through: :rental_applications
end
