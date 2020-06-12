class UserMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.fr'

  def meeting_notification_user(appointment)
    @appointment = appointment
    @owner = appointment.owner
    @user = appointment.user

    mail(to: @user.email, subject: 'Votre rdv a été enregistré !')
  end
end
