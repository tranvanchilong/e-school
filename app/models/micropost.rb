class Micropost < ApplicationRecord
  belongs_to :user
   mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size
  has_many :post_comments, dependent: :destroy
  validate :image
  has_one_attached :image
  has_many_attached :images
  has_one :image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :image, reject_if: proc { |attributes| attributes[:image_url].blank? }
  # attr_accessible :image
  belongs_to :album
  mount_uploader :image, ImageUploader

  # attr_accessible :remote_image_url

  private
# Validates the size of an uploaded picture.
def picture_size
if picture.size > 5.megabytes
errors.add(:picture, "should be less than 5MB")
end
end
end
