class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:account_overview, :toggle_favorite]
  before_action :set_user, only: [:show, :toggle_favorite]

  def home

  end

  def show
    # @user is set by the set_user method
    @time_slots = @user.time_slots
    @sanitized_time_slots = @time_slots.map do |slot|
      {
        date: slot.date.to_s,
        times: [slot.start_time.strftime('%H:%M'), slot.end_time.strftime('%H:%M')]
    }
    end
    # @time_slots = @user.time_slots
    @booking = Booking.new
  end

  def getstarted
    @user = User.new
  end


  def toggle_favorite
    begin
      if current_user.favorited?(@user)
        current_user.unfavorite(@user)
        message = 'User unfavorited.'
      else
        current_user.favorite(@user)
        message = 'User favorited.'
      end

      respond_to do |format|
        format.json { render json: { message: message, success: true } }
      end
    rescue ActiveRecord::RecordNotUnique
      respond_to do |format|
        format.json { render json: { error: 'Duplicate favorite action', success: false }, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.search(params[:query], params[:experience_level])

    # if @users.empty? && params[:query].present? && params[:experience_level].present?
    # end

    render 'index'
  end

  def account_overview
    @user = current_user
    @pending_requests = Booking.where(user: @user).where(status: 'open')
    # @upcoming_bookings = Booking.joins(:time_slot)
    #                             .where(user: @user).or(Booking.joins(:time_slot)
    #                             .where(booker: @user)).upcoming
    #                             .where(status: 'approved')
    @upcoming_bookings = Booking.joins(:time_slot)
                            .where(user: @user).or(Booking.joins(:time_slot)
                            .where(booker: @user))
                            .where(status: ['approved', 'open'])
                            .upcoming
    @past_bookings = Booking.joins(:time_slot)
                                .where(user: @user).or(Booking.joins(:time_slot)
                                .where(booker: @user)).past
                                .where(status: 'approved')
    @time_slots = current_user.time_slots || [] # <------- this line is used in my_availability tab
  end


  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found."
    redirect_to root_path
  end
end
