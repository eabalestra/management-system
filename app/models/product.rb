class Product < ApplicationRecord
  has_one_attached :image_url

  belongs_to :supplier
end
