class Picture < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  mount_uploader :file_path, PictureUploader
end
