class Admin::ProductCategoriesController < ApplicationController
	def index
		@product_category = ProductCategory.new
		@product_categories = ProductCategory.all

	# 	if @product_categories.is_active == 1
	# 		@active = "有効"
	# 	else
	# 		@active = "無効"
	# 	end
	end

	def create
		@product_category = ProductCategory.new(product_category_params)
		if @product_category.save
			redirect_back(fallback_location: root_path)
			# , notice: "新しいジャンルを登録しました"
		end
	end

	def edit
	end

	def update
	end

	private
	def product_category_params
		params.require(:product_category).permit(:name,:is_active)
	end
end
