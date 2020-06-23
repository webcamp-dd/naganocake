class Order < ApplicationRecord
	belongs_to :customer
	has_many :cart_products, class_name: 'CartProduct', dependent: :destroy
	has_many :order_products, class_name: 'OrderProduct', dependent: :destroy
	enum payment: { creditcard: 0, bank: 1}


end
