class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    current_user.favorite(@user)
    flash[:notice] ='Buddy has been favorited.'
    render :show_notice
  end

  def destroy
    current_user.unfavorite(@user)
    flash[:notice] = 'Buddy has been unfavorited.'
    render :show_notice
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found."
    redirect_to root_path 
  end
end
