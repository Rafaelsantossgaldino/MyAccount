module UseCase
  module Accounts
    class Transferencia
      def self.run(customer_id, name_bank, agency, num_account, type, new_balance_value)
        return nil if not Customer.exists?(customer_id)
        customer = UseCase::Accounts::Utils.taxa_tranferencia(customer_id, name_bank, agency, num_account, type, new_balance_value)
      end
    end
  end
end