class OwnerMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.fr'

  def meeting_notification_owner(appointment)
    @appointment = appointment
    @owner = appointment.owner
    @user = appointment.user

    mail(to: @owner.email, subject: "Vous avez reçu une demande de rdv !")
  end
end
