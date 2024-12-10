class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.decimal :price_at_sale, precision: 11, scale: 2, null: false
      t.decimal :discount, precision: 5, scale: 2, default: 0.0
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
