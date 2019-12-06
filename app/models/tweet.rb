class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags
  

  mount_uploader :image, ImageUploader

  validates :image,      presence: { message: 'をアップロードしてください' }
  validates :title,      presence: true
  validates :content,    presence: true

  validates :tag_ids,     presence: { message: 'を選択してください'}
  

end

