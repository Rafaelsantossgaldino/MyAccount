class Account < ApplicationRecord
  belongs_to :bank
  validates :agency, :num_account, :name, presence: true
end
