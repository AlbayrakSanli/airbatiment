class HousesController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show, :search]

  def index
    @houses = House.all
  end

  def search
    @houses = House.where("city LIKE ?", "%" + params[:q] + "%")
  end

  def show
    @house = House.find(params[:id])
    @owner = @house.owner
  end

  def edit
    @house = House.find(params[:id])
    @cities = City.all
  end

  def new
    @house = House.new
    @cities = City.all
  end

  def create
    @house = House.new(
      title: params[:title],
      description: params[:description],
      price_house: params[:price_house],
      price_visit: params[:price_visit],
      area: params[:area],
      room: params[:room],
      owner: current_owner,
      city: City.find_by(name: params[:city])
    )
    if @house.save
      redirect_to root_path
      flash[:success] = "La maison a bien été modifié!"
    else
      flash[:danger] = "La saisie n'a pas un format valide, merci de saisir à nouveau"
      redirect_to new_house_path
    end
  end

  def update
    @house = House.find(params[:id])
    if @house.update(
      title: params[:title],
      description: params[:description],
      price_house: params[:price_house],
      price_visit: params[:price_visit],
      area: params[:area],
      room: params[:room],
      owner: current_owner,
      city: City.find_by(name: params[:city])
    )
      redirect_to root_path
      flash[:success] = "La maison a bien été modifié!"
    else
      flash[:danger] = "La saisie n'a pas un format valide, merci de saisir à nouveau"
      redirect_to house_path
    end
  end

  def destroy
    House.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def authenticate_owner!
		unless owner_signed_in?
      flash[:danger] = "Not logged in."
			redirect_to new_owner_session_path
		end
	end

end
