module UseCase
  module Accounts
    class Create
      def self.run(customer_id, name_bank, agency, num_account, balance)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        customer.accounts.create({name_bank: name_bank, agency: agency, num_account: num_account, balance: balance})
        return {
          customer: customer.accounts
        }
      end
    end
  end
end
