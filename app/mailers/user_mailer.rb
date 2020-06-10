class UserMailer < ApplicationMailer
    default from: 'airbatiment@yopmail.fr'

  def meeting_confirmation(appointment)
    @appointment = appointment
    @user = appointment.user
    @url  = 'http://monsite.fr/login'

    mail(to: @user.email, subject: 'Votre rdv a été enregistré !')
  end
end
