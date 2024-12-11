class Product < ApplicationRecord
  has_one_attached :image_url

  belongs_to :supplier
  belongs_to :category

  validates :name, presence: true
  validates :unit_cost, presence: true
  validates :description, presence: true
end
