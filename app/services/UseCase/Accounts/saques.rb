module UseCase
  module Accounts
    class Saques
      def self.run(customer_id, name_bank, agency, num_account, new_balance_value)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        balance = customer.accounts.where(agency: agency)
        get_value = customer.accounts.where(agency: agency).map(&:balance).last
        soma = get_value - new_balance_value
        if soma
          balance.update({balance: soma})
          customer.transactions.create(kind: :remover, qtd_balance: new_balance_value)
          balance.reload
          return {
            customer: customer.name,
            account: customer.accounts.where(agency: agency).map(&:balance).last
          }
        else
         return false
        end
      end
    end
  end
end
