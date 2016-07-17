class User < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :display_name, presence: true

  def find_like(obj)
    obj.likes.find_by(user_id: self.id)
  end
end
