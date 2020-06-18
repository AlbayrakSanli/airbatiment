class AvailabilitiesController < ApplicationController
  def new
    @house = House.find(params[:house_id])
    @availabilities = @house.availabilities
  end

  def create
    @availability = Availability.new(house_id: params[:house], date_start: params[:date_start], duration: params[:duration])

    if @availability.save
      flash[:success] = "Availability registration successfully saved"
      redirect_to owner_path(current_owner)
    else
      flash[:failure] = "Availability registration saving failed"
      render :new
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    if current_owner == @availability.house.owner
      @availability.destroy
      redirect_to owner_path(current_owner)
    else
      redirect_to root_path
    end
  end
end
