class ChargesController < ApplicationController
  def new
    @house = House.find(params[:id])
  end

  def create
    @house = House.find(params[:id])
    # Amount in cents
    @amount = @house.price_visit

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
