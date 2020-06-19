class GpicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.gpicture.attach(params[:gpicture])
      redirect_to(house_path(@house))
  end
end
