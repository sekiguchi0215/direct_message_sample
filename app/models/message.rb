class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications

  validates :content, presence: true

  def create_notification_direct_message!(current_user, visited_id)
    temp = Notification.where(visitor_id: current_user.id, visited_id: visited_id, action: "direct_message")
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: visited_id,
        action: "direct_message",
      )

      notification.save if notification.valid?
    else
      temp.update(checked: false)
    end
  end
end
