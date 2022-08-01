class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  mount_uploader :image_url, ImageUploader
    has_one_attached :image

end
