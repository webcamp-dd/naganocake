class Order < ApplicationRecord
    belongs_to :customer
    has_many :cart_products, class_name: 'CartProduct', dependent: :destroy
end
