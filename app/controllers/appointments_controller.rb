class AppointmentsController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new
    @owner = Owner.find(params[:id])
  end

  def create
    @appointment = Appointment.new(user_id: params[:user_id], owner_id: params[:owner_id], duration: params[:duration], start_date: params[:start_date], stripe_customer_id: params[:customer_id])

    if @appointment.save
      flash[:success] = "Appointment registration successfully saved"
      redirect_to root_path
    else
      flash[:failure] = "Appointment registration saving failed"
      redirect_to root_path
    end
  end

  def index
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end

