class HousesController < ApplicationController
  before_action :authenticate_owner, only: [:new, :edit]

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @owner = @house.owner
  end

  def edit
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def authenticate_owner
    unless current_owner
      flash[:danger] = "Not logged in."
      redirect_to new_owner_session_path
    end
  end
end
