class Customer::HomesController < ApplicationController
  def top
    # @random = Product.order("RANDOM()").limit(5).where(sales_status: true)
    @category = ProductCategory.all
    @product = Product.where(sales_status: true)
    @all_ranks = @product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
  end
end