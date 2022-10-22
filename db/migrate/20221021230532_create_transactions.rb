class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.integer :qtd_balance
      t.integer :customer_id
      t.timestamps
    end
  end
end
