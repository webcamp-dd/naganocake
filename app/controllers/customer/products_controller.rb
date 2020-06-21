class Customer::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    @product = Product.new
    @category = ProductCategory.all
  end

# @random = Product.order("RAND()").limit(4)
# @category = ProductCategory.find(params[:id])
# @category = ProductCategory.new

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end


  def category
    @categories = ProductCategory.find(params[:id])
  end

  private
	  	def product_params
		 	params.require(:product).permit(:name, :description, :unit_price, :product_image, :sales_status)
      end
    
end