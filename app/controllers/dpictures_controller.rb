class DpicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.dpicture.attach(params[:dpicture])
      redirect_to(house_path(@house))
  end
end
