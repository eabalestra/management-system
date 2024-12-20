# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user, optional: true

  enum account_type: %i[personal business]
end
