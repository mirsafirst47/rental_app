class Tenant < ApplicationRecord
    has_many :rental_applications
    has_many :apartments, through: :rental_applications

    validates :name, presence: true, uniqueness: true
    validates :email_address, presence: true, uniqueness: true
    validates :age, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 21 }

    has_secure_password
end
