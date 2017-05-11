class Styleboard < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :likes, class_name: 'StyleboardLike'
  has_many :hashtags
  mount_uploader :photo, PhotoUploader

end
