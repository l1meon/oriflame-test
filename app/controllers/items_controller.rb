class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update,  :destroy]
  respond_to :html, :js, :xml, :json


  def new
    @item = Item.new
  end


  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @item = @cart.add_product(product.id)
    @item.product = product

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item.cart, notice: 'Item was successfully created.' }
        format.js { @current_item = @item }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end





  private

  def set_item
    @category = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_id, :cart_id, :order_id, :quantity)
  end
end
