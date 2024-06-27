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
      time_slot = @booking.time_slot
      time_slot.reserved = true
      time_slot.save!

      redirect_to account_overview_user_path(current_user), notice:"Booking was successfully created!"
    else
      redirect_to user_path(@user), alert: "Failed to create booking."
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to account_overview_user_path(current_user), status: :see_other, notice: "Booking deleted successfully"
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
