class Customer::HomesController < ApplicationController
  def top
    @random = Product.order("RANDOM()").limit(5).where(sales_status: true)
    @category = ProductCategory.all
    @all_ranks = Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
  end
end

# @product_categories = ProductCategory.all
# @product_category = ProductCategory.find(params[:id])
# @product_categories = @product_category.products