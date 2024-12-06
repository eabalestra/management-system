class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 11, scale: 2, default: 0.0
      t.integer :transaction_type
      t.references :source_account, foreign_key: { to_table: :accounts }, null: true
      t.references :destination_account, foreign_key: { to_table: :accounts }, null: true
      t.string :description
      t.datetime :timestamp
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
