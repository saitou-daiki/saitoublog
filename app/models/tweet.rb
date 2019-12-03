class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  mount_uploader :image, ImageUploader

  validates :image,      presence: { message: 'をアップロードしてください' }
  validates :title,      presence: true
  validates :content,    presence: true
end

