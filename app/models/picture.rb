class Picture < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  belongs_to :user
  mount_uploader :file_path, PictureUploader
end
