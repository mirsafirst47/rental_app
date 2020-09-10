class RentalApplication < ApplicationRecord
  belongs_to :tenant
  belongs_to :apartment

  # validates :description, length: {minimum: 20, maximum: 100}, presence: true
end
