class BookingsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.booker = current_user
    @booking.user = @user
    # @time_slot = TimeSlot.find(params[:id])
    @booking.time_slot = @time_slot

    if @booking.save!
      redirect_to account_overview_user(current_user)
      flash[:notice]="Booking was successfully created!"
    # else
    # render 'user/show', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :note, :buddy2_id)
  end
end


# dem div ein data-slot-id="<%= slot.id %>" geben
# stimulus controller erstellen und dieses div targeten
# im Modal mit Hilfe des Targets den richtigen Slot finden (TimeSlot.find...)
