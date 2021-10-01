class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :group_messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def check_group_message_notification(current_user)
    unchecked_messges = group_messages.where(checked: false).where.not(user_id: current_user)
    unchecked_messges.map { |message| message.update(checked: true) }
  end

  def group_invitation_notification(current_user, visited_id, group_id)
    notification = current_user.active_notifications.new(
      visited_id: visited_id,
      group_id: group_id,
      action: "invitation",
    )
    notification.save if notification.valid?
  end
end
