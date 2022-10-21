module UseCase
  module Accounts
    class Saques
      def self.run(customer_id, name_bank, agency, num_account, new_balance_value)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        balance = customer.accounts
        get_value = customer.accounts.map(&:balance).last
        soma = get_value - new_balance_value
        if (soma) >= 0
          balance.update({balance: soma})
          balance.reload
          return {
            customer: customer.name,
            account: customer.accounts.map(&:name_bank).last,
            balance: customer.accounts.map(&:balance).last
          }
        else
         return false
        end
      end
    end
  end
end
