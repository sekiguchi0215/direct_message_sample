class GroupMessage < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :content, presence: true

  def group_message_notification(current_user, visited_ids, group_id)
    visited_ids.each do |visited_id|
      save_group_message_notification(current_user, visited_id[:user_id], group_id)
    end
  end

  def save_group_message_notification(current_user, visited_id, group_id)
    # group_id = group.id
    temp = Notification.where(visitor_id: current_user.id, visited_id: visited_id, group_id: group_id)
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: visited_id,
        group_id: group_id,
        action: "group_message",
      )
      notification.save if notification.valid?
    else
      temp.update(checked: false)
    end
  end
end
