class UserMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.com'

  def meeting_notification_user(appointment)
    @appointment = appointment
    @owner = appointment.house.owner
    @user = appointment.user
    @availability = @appointment.availability

    mail(to: @user.email, subject: 'Votre rdv a été enregistré !')
  end
end
