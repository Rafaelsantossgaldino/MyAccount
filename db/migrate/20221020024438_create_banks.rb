class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
