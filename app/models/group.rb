class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :group_messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def check_group_message_notification(current_user)
    unchecked_messges = group_messages.where(checked: false).where.not(user_id: current_user)
    unchecked_messges.map { |message| message.update(checked: true) }
  end
end
