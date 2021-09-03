class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  enum status: [:public, :private], _prefix: true
end
