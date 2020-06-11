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
    @house = House.new(post_params)
    if @house.save
      flash[:success] = 'Maison créée !'
      render 'houses/show'
    else
      flash[:alert] = 'erreur'
      render 'houses/new'
    end
  end

  def update
    @house = House.find(params[:id])
    if @house.update(post_params)
      flash[:success] = "Mis à jour ok!"
      render 'houses/show'
    else
      flash[:alert] = 'erreur'
      render 'houses/edit'
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    flash[:danger] = 'Supprimé !'
    render 'index'
  end

  def authenticate_owner
    unless current_owner
      flash[:danger] = "Not logged in."
      redirect_to new_owner_session_path
    end
  end

  private

  def post_params
    params.permit(:title, :description, :price_visit, :area, :room)
  end

end
