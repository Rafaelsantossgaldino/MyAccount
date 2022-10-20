class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :bank, null: false, foreign_key: true
      t.string :name
      t.string :agency
      t.string :num_account
      t.integer :balance, default: 0

      t.timestamps
    end
  end
end
