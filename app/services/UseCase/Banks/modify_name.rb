module UseCase
  module Banks
    class ModifyName
      def self.run(customer_id, new_name_bank)
        return nil if not Customer.exists?(customer_id)
        customer = Customer.find(customer_id)
        name_bank = customer.bank
        if name_bank.update({name: new_name_bank})
          name_bank.reload
          return {
            name_bank: customer.bank.name
          }
        else
          return false
        end
      end
    end
  end
end
