class AppointmentsController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new
    @house = House.find(params[:id])
    @owner = @house.owner
  end

  def create
    @appointment = Appointment.new(user_id: params[:user], owner_id: params[:owner], duration: params[:duration], date_start: params[:date_start])

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

