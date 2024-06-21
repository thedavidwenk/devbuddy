class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def home

  end

  def show
    # @user is set by the set_user method
    @time_slots = @user.time_slots
  end


  def index
    @users = User.all

    if params[:query].present?
      @users = User.search_by_programming_language_and_experience_level(params[:query])
    else
      flash[:note] = "No search result found."
      @users = User.all
    end
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
