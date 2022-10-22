module UseCase
  module Customers
    class QueryCustomer
      def self.run(customer_id)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        return {
          name: customer.name,
          accounts: customer.accounts
        }
      end
    end
  end
end
