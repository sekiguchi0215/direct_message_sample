module ApplicationHelper
  def notification_checked
    current_user.passive_notifications.where(checked: false).any?
  end
end
