class GroupMessage < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :group

  validates :content, presence: true
end
