class Order < ApplicationRecord
  belongs_to :user
  belongs_to :client

  has_many :order_items, dependent: :destroy
  has_many :order_payments, dependent: :destroy
end
