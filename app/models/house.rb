class House < ApplicationRecord
  include PgSearch::Model

  has_one_attached :avatar
  belongs_to :owner
  has_many :appointments
  has_many :users, through: :appointments

  has_many :availabilities

  validates :title,
            presence: true,
            length: { in: 3..20 }

  validates :description,
            presence: true,
            length: { in: 10..500 }

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

  validates :city,
            presence: true,
            length: { in: 2..30 }

  pg_search_scope :global_search,
    against: [:price_house, :price_visit, :area, :room],
    using: {
      tsearch: {any_word: true}
    }

end
