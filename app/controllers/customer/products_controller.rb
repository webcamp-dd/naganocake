class Customer::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    @product = Product.new
  end

# @category = ProductCategory.find(params[:id])
# @category = ProductCategory.new

  def show
    
  end

  def create
    product = Product.new(product_params)
    redirect_to customer_products_index_path
  end

  private
	  	def product_params
		 	params.require(:product).permit(:name, :description, :unit_price, :product_image, :sales_status)
      end
    
end