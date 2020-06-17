class OwnersController < ApplicationController

  def index
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
    )
      redirect_to owner_path
      flash[:success] = "La maison a bien été modifié!"
    else
      flash[:danger] = "La saisie n'a pas un format valide, merci de saisir à nouveau"
      redirect_to edit_owner_path
    end
  end

  def destroy
    Owner.find(params[:id]).delete
    redirect_to root_path
  end





end
