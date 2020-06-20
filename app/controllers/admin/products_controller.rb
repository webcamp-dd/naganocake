class Admin::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to admin_products_show_path(@product), notice: "保存できました"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    redirect_to admin_products_show_path(@product)
  else
    render "edit"
  end
  end

  private
  def product_params
    params.require(:product).permit(:name,:description,:unit_price,:product_image_id,:sales_status)
    # :product_category_id 一旦保留
  end
end
