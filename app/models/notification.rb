class Notification < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :message, optional: true
  belongs_to :group_message, optional: true
  belongs_to :visitor, class_name: "User", foreign_key: "visiter_id", optional: true
  belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true
end
