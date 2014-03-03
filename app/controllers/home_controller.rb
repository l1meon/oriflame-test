class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @categories = Category.all
    @products = Product.all
  end

  def faq

  end

  def about

  end
end
