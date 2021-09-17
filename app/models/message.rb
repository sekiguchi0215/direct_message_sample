class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true

  def create_notification_direct_message!(current_user)
    notification = current_user.active_notifications.new(
      message_id: id,
      visited_id: user_id,
      action: "message",
    )
    notification.save if notification.valid?
  end
end
