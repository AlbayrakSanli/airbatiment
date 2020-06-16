class AvailabilitiesController < ApplicationController
  def new
    @house = House.find(params[:house_id])
  end

  def create
    @availability = Availability.new(house_id: params[:house], date_start: params[:date_start], duration: params[:duration])

    if @availability.save
      flash[:success] = "Availability registration successfully saved"
      redirect_to root_path
    else
      flash[:failure] = "Availability registration saving failed"
      redirect_to root_path
    end
  end
end
