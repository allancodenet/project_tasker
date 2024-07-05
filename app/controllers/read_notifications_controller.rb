class ReadNotificationsController < ApplicationController
  def read_all
    current_user.notifications.mark_as_read
    redirect_to notifications_path, notice: "All Notifications read"
  end
end
