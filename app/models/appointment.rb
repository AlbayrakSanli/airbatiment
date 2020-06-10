class Appointment < ApplicationRecord
  after_create :meeting_confirmation

  belongs_to :user
  belongs_to :owner

  def meeting_confirmation
    UserMailer.meeting_confirmation(self).deliver_now
  end
end
