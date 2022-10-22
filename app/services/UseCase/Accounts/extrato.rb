module UseCase
  module Accounts
    class Extrato
      def self.run(customer_id)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        return customer.transactions
      end
    end
  end
end
