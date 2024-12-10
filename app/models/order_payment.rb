class OrderPayment < ApplicationRecord
  belongs_to :order

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_method, presence: true
  validates :paid_at, presence: true

  enum payment_method: { credit_card: 0, debit_card: 1, cash: 2, transfer: 3 }
end
