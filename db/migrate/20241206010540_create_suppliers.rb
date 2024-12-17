class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :phone
      t.string :address
      t.string :email
      t.string :city
      t.string :website

      t.timestamps
    end
  end
end
