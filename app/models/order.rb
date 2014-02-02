class Order < ActiveRecord::Base
  has_many :items, dependent: :destroy

  def add_items_from_cart(cart)
    cart.items.each do |item|
      item.cart_id = nil
      items << item
    end
  end
end
