class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:edit, :update, :destroy]

  def new
    @time_slot = TimeSlot.new
  end

  def create

    start_time = params["start_time"]
    end_time = params["end_time"]
    date = params["date"]

    @user = current_user
    @time_slot = current_user.time_slots.new(start_time: start_time, end_time: end_time, date: date)

    if @time_slot.save
      redirect_to account_overview_user_path(@user), notice: 'Time slot was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @time_slot.update(time_slot_params)
      redirect_to account_overview_user_path, notice: 'Time slot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @time_slot.destroy
    redirect_to account_overview_user_path, notice: 'Time slot was successfully deleted.'
  end

  private

  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    params.require(:time_slot).permit(:date, :start_time, :end_time)
  end
end
