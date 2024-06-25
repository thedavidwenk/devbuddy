class BookingsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.booker = current_user
    @booking.user = @user

    if @booking.save!
      redirect_to account_overview_user_path(current_user), notice:"Booking was successfully created!"
    else
      redirect_to user_path(@user), alert: "Failed to create booking."
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :booker_id, :time_slot_id, :note)
  end
end
