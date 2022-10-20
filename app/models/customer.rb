class Customer < ApplicationRecord
  has_one :bank, foreign_key: :customer_id
  has_many :accounts, :through => :bank
end
