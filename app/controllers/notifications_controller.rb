class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.order(:updated_at)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
