class AvatarsController < ApplicationController
  def create
    if user_signed_in?
      @user = User.find(params[:user_id])
      @user.avatar.attach(params[:avatar])
      redirect_to(user_path(@user))
    elsif owner_signed_in?
      @owner = Owner.find(params[:owner_id])
      @owner.avatar.attach(params[:avatar])
      redirect_to(owner_path(@owner))
    end
  end
end
