class Customer::ProductsController < ApplicationController
  def index
  end

  def show
    @category = ProductCategory.find(params[:id])
  end

  private
	  	def product_params
		 	params.require(:product).permit(:name, :description, :unit_price, :product_image_id, :sales_status)
	  	end
end