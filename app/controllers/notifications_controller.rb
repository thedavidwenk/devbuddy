class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    notifications_data = {
      unread_count: current_user.notifications.unread.count
    }
    render json: notifications_data

    # notifications = current_user.notifications.unread
    # render json: { unread_count: notifications.count }
  end

  def mark_as_read
    notification = current_user.notifications.find(params[:id])
    if notification.update(read: true)
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end
end
