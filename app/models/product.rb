# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    name: 'A',
    description: 'B'
  }

  ORDER_BY = {
    'newest' => { created_at: :desc },
    'expensive' => { unit_price: :desc },
    'cheapest' => { unit_price: :asc }
  }.freeze

  has_one_attached :image_url

  validates :name, presence: true
  validates :unit_cost, presence: true
  validates :description, presence: true

  belongs_to :supplier
  belongs_to :category
end
