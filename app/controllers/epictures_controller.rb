class EpicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.epicture.attach(params[:epicture])
      redirect_to(house_path(@house))
  end
end
