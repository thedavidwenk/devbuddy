class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def home

  end

  def show
    # @user is set by the set_user method
  end


  def index
    @users = User.search(params[:query], params[:experience_level])
    
    if @users.empty? && params[:query].present? && params[:experience_level].present?
      flash.now[:notice] = "No users found matching the search criteria."
    end
    
    render 'index'
  end

  def account_overview
    @user = current_user
    @upcoming_bookings = Booking.where(buddy1: @user).or(Booking.where(buddy2: @user)).upcoming.includes(:buddy1, :buddy2)
    @past_bookings = Booking.where(buddy1: @user).or(Booking.where(buddy2: @user)).past.includes(:buddy1, :buddy2)

  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found."
    redirect_to root_path
  end
end
