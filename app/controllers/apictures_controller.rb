class ApicturesController < ApplicationController
  def create
      @house = House.find(params[:house_id])
      @house.apicture.attach(params[:apicture])
      redirect_to(house_path(@house))
  end
end
