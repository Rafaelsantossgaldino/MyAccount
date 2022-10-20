module UseCase
  module Customer
    class CreateUser
      def self.run(customer_id)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        customer.build_name(name: nil) if not customer.name
        customer.save
        customer
      end
    end
  end
end
