class Notification < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :message, optional: true
  belongs_to :group_message, optional: true
  belongs_to :visiter, class_name: "User", foreign_key: "visiter_id", optional: true
  belongs_t0 :visited, class_name: "User", foreign_key: "visited_id", optional: true
end
