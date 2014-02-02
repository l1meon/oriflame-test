class CombineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          cart.items.where(product_id: product_id).delete_all

          item = cart.items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
