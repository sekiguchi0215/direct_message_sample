class Post < ApplicationRecord
  belongs_to :user
  enum status: [:public, :private], _prefix: true
end
