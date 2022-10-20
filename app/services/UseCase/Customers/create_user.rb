module UseCase
  module Customers
    class CreateUser
      def self.run(customer_id)
        byebug
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        result = customer.bank.account
        return {
          name: customer.name,
          bank: customer.bank.name,
          agency: customer.accounts
        }
      end
    end
  end
end
