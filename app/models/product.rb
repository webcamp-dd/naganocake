class Product < ApplicationRecord
    has_many :cart_items,dependent: :destroy
    attachment :product_image
end
