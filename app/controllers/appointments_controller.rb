class AppointmentsController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new
    @house = House.find(params[:id])
    @owner = @house.owner
  end

  def create
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
  end

  def index
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if current_user == @appointment.user
      @appointment.destroy
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
