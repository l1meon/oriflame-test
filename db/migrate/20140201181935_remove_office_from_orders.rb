class RemoveOfficeFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :office
  end
end
