module UseCase
  module Accounts
    class Deposit
      def self.run(customer_id, name_bank, agency, num_account, new_balance_value)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        get_value = customer.accounts.where(agency: agency).map(&:balance).last
        if customer.accounts.where(name_bank: name_bank).update({balance: get_value + new_balance_value })
          customer.transactions.create(kind: :creditar, qtd_balance: new_balance_value)
          customer.reload
          return {
            customer: customer.name,
            name_bank: customer.accounts.where(name_bank: name_bank).map(&:name_bank).last,
            balance: customer.accounts.where(agency: agency).map(&:balance).last
          }
        else
          return false
        end
      end
    end
  end
end
