# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :source_account, class_name: 'Account', optional: true, foreign_key: 'source_account_id'
  belongs_to :destination_account, class_name: 'Account', optional: true, foreign_key: 'destination_account_id'
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true
  validates :user, presence: true

  enum transaction_type: %i[deposit withdrawal transfer order_payment]
end
