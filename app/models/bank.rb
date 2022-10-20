class Bank < ApplicationRecord
  belongs_to :customer, foreign_key: :customer_id, required: false
  has_many :account
end
