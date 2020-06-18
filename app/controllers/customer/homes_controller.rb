class Customer::HomesController < ApplicationController
  def top
    @product_categories = ProductCategory.all
  end
end
