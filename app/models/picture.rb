class Picture < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  attr_accessor :filter

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :file_path, PictureUploader
end
