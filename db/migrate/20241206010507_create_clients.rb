class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :phone
      t.string :address
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
