class FpicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.fpicture.attach(params[:fpicture])
      redirect_to(house_path(@house))
  end
end
