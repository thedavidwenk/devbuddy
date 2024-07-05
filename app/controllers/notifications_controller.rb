class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.all 
    notifications_data = {
      unread_count: current_user.notifications.unread.count
    }
    render json: notifications_data
  end

  def mark_as_read
    notification = current_user.notifications.find(params[:id])
    if notification.update(read: true)
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end
end

