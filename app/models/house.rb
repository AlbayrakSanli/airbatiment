class House < ApplicationRecord
  belongs_to :owner
  belongs_to :city

  validates :title,
            presence: true,
            length: { in: 3..20 }

  validates :description,
            presence: true,
            length: { in: 100..500 }

  validates :price_house,
            presence: true,
            numericality: { only_integer: true, greater_than: 100_000 }

  validates :price_visit,
            presence: true,
            numericality: { only_integer: true, greater_than: 15, less_than: 500 }

  validates :area,
            presence: true,
            numericality: { only_integer: true, greater_than: 60 }

  validates :room,
            presence: true,
            numericality: { only_integer: true, greater_than: 2}


end
