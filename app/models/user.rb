class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def admin?
    is_admin
  end

  has_many :orders
  has_many :favorites
  has_many :favorite_products, :through => :favorites, :source => :product

  has_many :posts
  def is_favorite_of?(product)
    favorite_products.include?(product)
  end

  def short_name
    self.email.split('@').first
  end
end
