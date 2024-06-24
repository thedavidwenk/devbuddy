class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def home

  end

  def show
    # @user is set by the set_user method
    @time_slots = @user.time_slots
    @booking = Booking.new
  end


  def index
    @users = User.search(params[:query], params[:experience_level])
    
    # if @users.empty? && params[:query].present? && params[:experience_level].present?
    # end
    
    render 'index'
  end

  def account_overview
    @user = current_user
    @upcoming_bookings = Booking.joins(:time_slot).where(user: @user).or(Booking.joins(:time_slot).where(booker: @user)).upcoming
    @past_bookings = Booking.joins(:time_slot).where(user: @user).or(Booking.joins(:time_slot).where(booker: @user)).past
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found."
    redirect_to root_path
  end
end
