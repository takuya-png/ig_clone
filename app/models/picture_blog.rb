class PictureBlog < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 1000}
end
