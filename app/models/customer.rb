class Customer < ApplicationRecord
  has_many :accounts
  has_many :transactions, foreign_key: :customer_id
end
