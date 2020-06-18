class Product < ApplicationRecord
    has_many :cart_product,
            class_name:  "CartProduct",
            foreign_key: "product_id",
            dependent: :destroy
    has_many :order_products,dependent: :destroy
    attachment :product_image

end
