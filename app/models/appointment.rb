class Appointment < ApplicationRecord
  after_create :meeting_notification_owner, :meeting_notification_user

  belongs_to :user
  belongs_to :house

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
