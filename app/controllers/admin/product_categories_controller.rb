class Admin::ProductCategoriesController < ApplicationController
  def index
  	@product_category = ProductCategory.new
  	@product_categories = ProductCategory.all
  end

  def create
  end

  def edit
  end

  def update
  end
end
