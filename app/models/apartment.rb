class Apartment < ApplicationRecord
  has_many :rental_applications
  has_many :tenants, through: :rental_applications
  belongs_to :broker
  belongs_to :neighborhood
end
