class City < ApplicationRecord
  has_many :house

  validates :name,
            presence: true
end
