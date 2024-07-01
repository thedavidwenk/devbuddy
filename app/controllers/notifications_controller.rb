class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch notifications data here
    notifications_data = {
      unread_count: current_user.notifications.unread.count
      # Other relevant data you may need
    }

    render json: notifications_data
  end
end
