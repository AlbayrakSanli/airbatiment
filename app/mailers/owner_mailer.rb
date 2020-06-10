class OwnerMailer < ApplicationMailer
  default from: 'airbatiment@yopmail.fr'

  def meeting_notification_owner(appointment)
    @appointment = appointment
    @owner = appointment.owner
    @url  = 'http://monsite.fr/login'

    mail(to: @owner.email, subject: "Quelqu'un souhaite prendre rdv avec vous !")
  end
end
