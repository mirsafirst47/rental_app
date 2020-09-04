class RentalApplication < ApplicationRecord
  belongs_to :tenant
  belongs_to :apartment
end
