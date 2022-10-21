module UseCase
  module Customers
    class QueryCustomer
      def self.run(customer_id)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        result = customer.bank.account
        return {
          name: customer.name,
          bank: customer.bank.name
        }
      end
    end
  end
end
