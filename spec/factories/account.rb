FactoryBot.define do
  factory :account do
    name { Faker::Bank.name }
    agency { Faker::Bank.account_numbe }
    num_account { Faker::Bank.account_number(digits: 13) }
    balance { 5000 }
  end
end
