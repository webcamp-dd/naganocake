class Admin::ProductCategoriesController < ApplicationController

	def index
		@product_category = ProductCategory.new
		@product_categories = ProductCategory.all
	end

	def create
		@product_category = ProductCategory.new(product_category_params)
		if @product_category.save
			redirect_back(fallback_location: root_path)
		end
	end

	def edit
		@product_category = ProductCategory.find(params[:id])
	end

	def update
		@product_category = ProductCategory.find(params[:id])
		if @product_category.update(product_category_params)
			redirect_to admin_product_categories_path
		else
			render "edit"
		end
	end

	private
	def product_category_params
		params.require(:product_category).permit(:name,:is_active)
	end
end
