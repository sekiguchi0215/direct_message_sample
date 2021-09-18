class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true

  def create_notification_direct_message!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and message_id = ? and action = ?", current_user.id, user_id, id, "direct_message"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        message_id: id,
        visited_id: user_id,
        action: "direct_message",
      )

      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end

      notification.save if notification.valid?
    end
  end
end
