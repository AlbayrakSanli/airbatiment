class Availability < ApplicationRecord
  belongs_to :house
  belongs_to :appointment, optional: true
end
