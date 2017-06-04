class Product < ApplicationRecord

  scope :recent, ->{ order('created_at DESC')  }
  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :member_products, through: :favorites, source: :user
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos
end
