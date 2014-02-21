class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @cart = current_cart
    if @cart.items.empty?
      redirect_to root_path, notice: 'Your cart is empty'
      return
    end

    @order = Order.new
    respond_to do |format|
      format.html
      format.json { render json: @order}
    end
  end

  def create
    @order = Order.new(order_params)
    @order.add_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to root_path, notice: 'Spasibo'}
        format.json { render json: @order, status: :created, location: @order}
      else
        @cart = current_cart
        format.html { render action: 'new'}
        format.json { render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end












  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Заказ не найден!"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :adress, :office, :phone)
  end
end
