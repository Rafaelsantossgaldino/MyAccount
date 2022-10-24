module UseCase::Accounts::Utils
  def self.taxa_tranferencia(customer_id, name_bank, agency, num_account, type, new_balance_value)
    case type
    when "monday_friday"
      customer = Customer.find(customer_id)
      name_bank = customer.accounts.where(name_bank: name_bank).last
      get_value = customer.accounts.map(&:balance).last
      soma = get_value + new_balance_value + 5
      byebug
      if soma
        name_bank.update({balance: soma})
        name_bank.save
        return {
          account: name_bank
        }
      end
    when "saturday_sunday"
      customer = Customer.find(customer_id)
      name_bank = customer.accounts.where(name_bank: name_bank).last
      get_value = customer.accounts.map(&:balance).last
      soma = get_value + new_balance_value + 7
      if soma
        name_bank.update({balance: soma})
        name_bank.save
        return {
          account: name_bank
        }
      end
    when "more_than_a_thousand"
      customer = Customer.find(customer_id)
      name_bank = customer.accounts.where(name_bank: name_bank).last
      get_value = customer.accounts.map(&:balance).last
      soma = get_value + new_balance_value + 10
      if soma
        byebug
        name_bank.update({balance: soma})
        name_bank.save
        return {
          account: name_bank
        }
      end
    end
  end
end
