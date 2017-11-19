class Product < ApplicationRecord
  validates_presence_of :friendly_id,:title
  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id,:with => /\A[a-z0-9\-]+\z/
  scope :recent, ->{ order('created_at DESC')  }
  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :member_products, through: :favorites, source: :user
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos

  def to_param
    self.friendly_id
  end


end
