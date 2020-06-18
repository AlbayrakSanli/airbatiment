class OwnerMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.com'

  def meeting_notification_owner(appointment)
    @appointment = appointment
    @owner = appointment.house.owner
    @user = appointment.user
    @availability = @appointment.availability

    mail(to: @owner.email, subject: "[Airbatiment] - Vous avez reçu une demande de rdv !")
  end

  def cancellation(appointment)
    @appointment = appointment
    @owner = appointment.house.owner
    @user = appointment.user
    @availability = @appointment.availability

    mail(to: @owner.email, subject: "[Airbatiment] - Annulation de rdv")
  end
end
