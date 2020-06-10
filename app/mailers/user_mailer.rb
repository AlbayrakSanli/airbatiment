class UserMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.fr'

  def meeting_notification_user(appointment)
    @appointment = appointment
    @user = appointment.user
    @url  = 'http://monsite.fr/login'

    mail(to: @user.email, subject: 'Votre rdv a été enregistré !')
  end
end
