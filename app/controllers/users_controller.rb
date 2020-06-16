class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    if @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
    )
      redirect_to user_path
      flash[:success] = "La maison a bien été modifié!"
    else
      flash[:danger] = "La saisie n'a pas un format valide, merci de saisir à nouveau"
      redirect_to edit_user_path
    end
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to root_path
  end
end
