module UseCase
  module Accounts
    class Saldo
      def self.run(customer_id)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        return {
          customer: customer.name,
          saldo: customer.accounts.map(&:balance).last
        }
      end
    end
  end
end
