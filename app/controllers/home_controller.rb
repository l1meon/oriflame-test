class HomeController < ApplicationController
  def index
    @cart = current_cart
    @categories = Category.all
    @products = Product.all
  end
end
