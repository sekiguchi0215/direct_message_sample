module ApplicationHelper
  def direct_message_notification_checked
    current_user.passive_notifications.where(checked: false).any?
  end
end
