class Customer::HomesController < ApplicationController
  def top
    @random = Product.order("RANDOM()").limit(5)
    @category = ProductCategory.all
  end
end

# @product_categories = ProductCategory.all
# @product_category = ProductCategory.find(params[:id])
# @product_categories = @product_category.products