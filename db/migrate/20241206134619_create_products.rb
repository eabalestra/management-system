class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.string :image_url
      t.integer :stock_quantity, default: 0
      t.date :last_price_update
      t.date :last_stock_update
      t.decimal :unit_cost, precision: 11, scale: 2, null: false
      t.decimal :unit_price, precision: 11, scale: 2, null: false
      t.decimal :tax_amount, precision: 11, scale: 2, null: false
      t.decimal :profit_margin, precision: 11, scale: 2, default: 0.0
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
