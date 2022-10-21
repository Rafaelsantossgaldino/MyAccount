class Account < ApplicationRecord
  belongs_to :customer
  validates :agency, :num_account, :name_bank, presence: true
end
