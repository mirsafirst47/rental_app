class Neighborhood < ApplicationRecord
    has_many :apartments
    default_scope { order(safety_level: :desc) }
end
