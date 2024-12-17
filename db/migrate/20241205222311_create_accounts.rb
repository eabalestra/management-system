class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :balance, precision: 11, scale: 2, default: 0.0
      t.integer :account_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
