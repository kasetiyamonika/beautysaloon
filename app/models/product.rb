class Product < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2,maximum: 30}
  validates :description, length: { minimum: 5, maximum: 500 }
  validates :mrp, numericality: true
  validates :discount, numericality: true
  validates :discount_type, acceptance: { accept: ['Fix', '%'] }

  belongs_to :category
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :carts

  has_one_attached :image
end
