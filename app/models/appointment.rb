class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :owner

  validates :duration,
            presence: true,
            numericality: { only_integer: true, greater_than: 1, less_than: 1 }

  validates :date_start,
            presence: true
  validate :date_start_future?

  private

  def date_start_future?
    errors.add(:start_date, "Entrez une date valide postérieure à la date d'aujourd'hui")
    if date_start <= DateTime.now()
    end
  end

end
