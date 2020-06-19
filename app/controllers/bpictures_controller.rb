class BpicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.bpicture.attach(params[:bpicture])
      redirect_to(house_path(@house))
  end
end
