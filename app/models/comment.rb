class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tweet

  validates :comment, presence: true
end
