module UseCase
  module Accounts
    class Deposit
      def self.run(customer_id, new_value_name, new_value_agency, new_value_num_account, new_value_balance)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        if customer.accounts.update({name_bank: new_value_name, agency: new_value_agency, num_account: new_value_num_account, balance: new_value_balance})
          customer.accounts.reload
          return {
            customer: customer.name,
            accounts: customer.accounts
          }
        else
          return false
        end
      end
    end
  end
end
