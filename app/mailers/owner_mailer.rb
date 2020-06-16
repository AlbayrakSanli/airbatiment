class OwnerMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.com'

  def meeting_notification_owner(appointment)
    @appointment = appointment
    @owner = appointment.house.owner
    @user = appointment.user
    @availability = @appointment.availability

    mail(to: @owner.email, subject: "Vous avez reçu une demande de rdv !")
  end
end
