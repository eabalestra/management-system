class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :transaction_type
      t.integer :source_account_id
      t.integer :destination_account_id
      t.string :description
      t.datetime :timestamp

      t.timestamps
    end
  end
end
