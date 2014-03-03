class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_product, only: [ :show, :edit, :update,  :destroy]
  before_filter :authenticate_admin!, except: [:index, :show]
  before_action :set_cart
  respond_to :html, :xml, :json

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
  end

  def update
  end

  def destroy
  end





  private

  def set_product
    @category = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Продукт не найден!"
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:title, :title_ro, :description, :description_ro,:image_url, :about_product, :about_product_ro, :ingredients, :ingredients_ro, :category_id)
  end
end
