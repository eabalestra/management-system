class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    name: 'A',
    description: 'B'
  }

  has_one_attached :image_url

  belongs_to :supplier
  belongs_to :category

  validates :name, presence: true
  validates :unit_cost, presence: true
  validates :description, presence: true
end
