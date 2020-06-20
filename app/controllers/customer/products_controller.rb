class Customer::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    @product = Product.new
    
  end

# @random = Product.order("RAND()").limit(4)
# @category = ProductCategory.find(params[:id])
# @category = ProductCategory.new

  def show
    @product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to customer_products_index_path
  end

  private
	  	def product_params
		 	params.require(:product).permit(:name, :description, :unit_price, :product_image, :sales_status)
      end
    
end