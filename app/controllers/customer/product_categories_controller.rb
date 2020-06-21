class Customer::ProductCategoriesController < ApplicationController

    def new
        @category = ProductCategory.new
    end

    def create
        category = Product.new(product_params)
        category.save
        redirect_to customer_cart_products_index_path
    end

end
