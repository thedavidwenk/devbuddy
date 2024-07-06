class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create]
  before_action :set_booking, only: [:destroy, :accept, :reject]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.booker = current_user
    @booking.user = @user
    if @booking.save!
      # time_slot = @booking.time_slot
      # time_slot.reserved = true
      # time_slot.save!

      # Create a notification for the user being booked
      Notification.create(
        user: @user,
        message: "You have a new booking from #{current_user.first_name}",
        read: false
      )
      Rails.logger.info "Notification created for user #{@user.id}"
      redirect_to account_overview_user_path(current_user), notice: "Booking was successfully created!"
    else
      redirect_to user_path(@user), alert: "Failed to create booking."
    end
  end

  def destroy
    time_slot = @booking.time_slot

    if @booking.destroy
      time_slot.reserved = false
      time_slot.save!

      redirect_to account_overview_user_path(current_user), status: :see_other, notice: "Booking deleted successfully"
    else
      redirect_to account_overview_user_path(current_user), alert: "Failed to delete booking."
    end
  end


  def accept
    if @booking.update(status: "approved")
      redirect_to account_overview_user_path(current_user, anchor: "appointments"), notice: "Booking successfully approved"
    else
      redirect_to account_overview_user_path(current_user, anchor: "appointments"), alert: "Failed to approve booking"
    end
  end

  def reject
    if @booking.update(status: "rejected")
      redirect_to account_overview_user_path(current_user, anchor: "appointments"), notice: "Booking successfully rejected"
    else
      redirect_to account_overview_user_path(current_user, anchor: "appointments"), alert: "Failed to reject booking"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :booker_id, :time_slot_id, :note, :booking_date)
  end
end
