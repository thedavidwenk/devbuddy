class BookingsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_user

  def index
  end

  # def new
  #   @booking = @user.buddy1_bookings.new
  # end

  # def create
  #   @booking = @user.buddy1_bookings.new(booking_params)
  #   @booking.buddy2 = User.find(params[:booking][:buddy2_id]) # Ensure buddy2 is set correctly

  #   if @booking.save
  #     redirect_to user_bookings_path(@user), notice: 'Booking was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def booking_params
  #   params.require(:booking).permit(:start_date, :end_date, :note, :buddy2_id)
  # end
end
