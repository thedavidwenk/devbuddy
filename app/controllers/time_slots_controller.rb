class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:edit, :update, :destroy]

  def new
    @time_slot = TimeSlot.new
  end

  def create

    start_time = params["start_time"]
    end_time = params["end_time"]
    day = params["day"]

    @time_slot = TimeSlot.new(start_time: start_time, end_time: end_time, day: day)
    if @time_slot.save
      raise
      redirect_to users_path, notice: 'Time slot was successfully created.'
    else
      render :new
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
    params.require(:time_slot).permit(:start_time, :end_time, :day)
  end
end
