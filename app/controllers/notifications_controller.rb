class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.unchecked
  end

  def update
    notification = Notification.find(params[:id])
    notification.update(checked: true)
    redirect_to request.referer
  end

  def update_all
    @notifications = current_user.passive_notifications.unchecked.where.not(action: "inivitation")
    @notifications.map { |notification| notification.update(checked: true) }
    redirect_to request.referer
  end
end
