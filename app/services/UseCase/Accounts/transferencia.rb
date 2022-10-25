module UseCase
  module Accounts
    class Transferencia
      def self.run(customer_id, source_account_id, destination_account_id, amount)
        customer = Customer.find_by_id(customer_id)
        accounts = customer.accounts.where(customer_id: [source_account_id, destination_account_id])
        source_account = accounts.select{ |account| account.id == source_account_id }.first
        destination_account = accounts.select{ |account| account.id == destination_account_id }.first
        source_balance = source_account.balance - amount
        destination_balance = destination_account.balance + amount

        unless source_balance >= 0
          return { success: false, message: "Dinheiro insuficiente" }
        end

        ActiveRecord::Base.transaction do
          begin
            source_account.update!({ balance: source_balance })
            destination_account.update!({ balance: destination_balance })
          rescue
            return { success: false, message: "Não foi possivel realizar transferencia!" }
          end
        end

        return { success: true, message: "Transferencia realizada com sucesso!" }
      end
    end
  end
end
