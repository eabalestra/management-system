class CreateOrderPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :order_payments do |t|
      t.decimal :amount, precision: 11, scale: 2, null: false
      t.datetime :paid_at, null: false
      t.integer :payment_method, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
