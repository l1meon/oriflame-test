class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :edit, :update,  :destroy]
  before_filter :authenticate_admin!, except: [:index, :show]
  respond_to :html, :xml, :json

  def index
    @categories = Category.all
  end

  def show
    @cart = current_cart
    @category = Category.find(params[:id])
  end

  def edit

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_with(@category)
    else
      respond_with(@category.errors, status: :unprocessable_entity) do |format|
        format.html { render action: :new }
      end
    end
  end

  def update

  end

  def destroy

  end


  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Категория не найдена!"
  end

  def category_params
    params.require(:category).permit(:name, :name_ro)
  end

end
