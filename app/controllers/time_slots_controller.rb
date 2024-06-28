class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:edit, :update, :destroy]

  def new
    @time_slot = TimeSlot.new
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.save
      redirect_to availability_path, notice: 'Time slot was successfully created.'
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @time_slot.update(time_slot_params)
  #     redirect_to availability_path, notice: 'Time slot was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @time_slot.destroy
  #   redirect_to availability_path, notice: 'Time slot was successfully deleted.'
  # end

  private

  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    params.require(:time_slot).permit(:start_time, :end_time, :day)
  end
end
