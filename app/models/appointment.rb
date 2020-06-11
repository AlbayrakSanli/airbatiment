class Appointment < ApplicationRecord
  after_create :meeting_notification_owner, :meeting_notification_user

  belongs_to :user
  belongs_to :owner

  # validates :duration,
  #           presence: true,
  #           numericality: { only_integer: true, greater_than: 1, less_than: 1 }

  # validates :date_start,
  #           presence: true
  # validate :date_start_future?

  private

  def date_start_future?
    errors.add(:start_date, "Entrez une date valide postérieure à la date d'aujourd'hui")
    if date_start <= DateTime.now()
    end
  end

  def meeting_notification_owner
    OwnerMailer.meeting_notification_owner(self).deliver_now
  end

  def meeting_notification_user
    UserMailer.meeting_notification_user(self).deliver_now
  end

end
