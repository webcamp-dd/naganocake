class Customer::ProductCategoriesController < ApplicationController

    def index
        @category = ProductCategory.new
    end

end
