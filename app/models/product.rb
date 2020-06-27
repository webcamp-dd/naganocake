class Product < ApplicationRecord

	has_many :cart_products,
	class_name:  "CartProduct",
	foreign_key: "product_id",
	dependent: :destroy
	has_many :order_products,dependent: :destroy
	attachment :product_image
	belongs_to :product_category
	has_many :favorites, dependent: :destroy


	validates :name, 				 presence: true
	validates :description,  presence: true
	validates :unit_price, 	 presence: true
	validates :sales_status, presence: true


	
	def favorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end
  
end