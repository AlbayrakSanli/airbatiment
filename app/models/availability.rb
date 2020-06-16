class Availability < ApplicationRecord
  belongs_to :house
  has_one :appointment
end
