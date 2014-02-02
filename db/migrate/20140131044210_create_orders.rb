class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :adress
      t.string :office
      t.string :phone

      t.timestamps
    end
  end
end
