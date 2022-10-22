class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :customer
      t.string :name_bank
      t.string :agency
      t.string :num_account
      t.integer :balance

      t.timestamps
    end
  end
end
