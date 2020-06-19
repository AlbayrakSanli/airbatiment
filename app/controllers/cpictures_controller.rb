class CpicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.cpicture.attach(params[:cpicture])
      redirect_to(house_path(@house))
  end
end
