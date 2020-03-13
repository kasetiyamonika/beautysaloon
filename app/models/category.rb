class Category < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 100 }

  has_many :products, dependent: :destroy
end
