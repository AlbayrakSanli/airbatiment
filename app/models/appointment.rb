class Appointment < ApplicationRecord
  after_create :meeting_notification_owner, :meeting_notification_user
  after_destroy :cancellation

  belongs_to :user
  belongs_to :house

  has_one :availability

  private

  def date_start_future?
    errors.add(:start_date, "Entrez une date valide postérieure à la date d'aujourd'hui")
    if date_start <= DateTime.now()
    end
  end

  def meeting_notification_owner
    OwnerMailer.meeting_notification_owner(self).deliver_later(wait: 2.second)
  end

  def meeting_notification_user
    UserMailer.meeting_notification_user(self).deliver_later(wait: 2.second)
  end

  def cancellation
    OwnerMailer.cancellation(self).deliver_now
  end

end
