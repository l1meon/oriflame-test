class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_item, only: [ :show, :edit, :update,  :destroy]
  respond_to :html, :js, :xml, :json


  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    @item = @cart.add_product(product.id)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item.cart }
        format.js { @current_item = @item }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.js {@current_item = @item}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_id, :quantity)
  end
end
