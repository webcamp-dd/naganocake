class Product < ApplicationRecord

	has_many :cart_products,
	class_name:  "CartProduct",
	foreign_key: "product_id",
	dependent: :destroy
	has_many :order_products,dependent: :destroy
	attachment :product_image
	belongs_to :product_category
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end


