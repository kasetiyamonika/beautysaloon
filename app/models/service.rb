class Service < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :price, numericality: true
  validates :description, length: { minimum: 5, maximum: 500 }

  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  has_one_attached :image

end
