class ChargesController < ApplicationController
  def new
    @house = House.find(params[:house_id])
    @availability = Availability.find(params[:id])

  end

  def create
    @house = House.find(params[:house_id])
    # Amount in cents
    @amount = @house.price_visit * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @availability = Availability.find(params[:id])
    @appointment = Appointment.new(user_id: params[:user_id], house_id: params[:house_id])

    if @appointment.save
      @availability.update(appointment_id: @appointment.id)
      flash[:success] = "Appointment registration successfully saved"
      redirect_to user_path(current_user)
    else
      flash[:failure] = "Appointment registration saving failed"
      redirect_to root_path
    end

    OwnerMailer.meeting_notification_owner(@appointment).deliver_later(wait: 2.second)
    UserMailer.meeting_notification_user(@appointment).deliver_later(wait: 2.second)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
