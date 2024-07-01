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

      # Create a notification for the user being booked
      Notification.create(user: @user, message: "You have a new booking from #{current_user.email}", read: false)

      redirect_to account_overview_user_path(current_user), notice:"Booking was successfully created!"
    else
      redirect_to user_path(@user), alert: "Failed to create booking."
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    time_slot = @booking.time_slot

    if @booking.destroy
      time_slot.reserved = false
      time_slot.save!

      redirect_to account_overview_user_path(current_user), status: :see_other, notice: "Booking deleted successfully"
    else
      redirect_to account_overview_user_path(current_user), alert: "Failed to delete booking."
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
