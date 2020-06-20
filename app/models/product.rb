class Product < ApplicationRecord
<<<<<<< Updated upstream
    has_many :cart_items,dependent: :destroy
    attachment :product_image
=======
    has_many :cart_product,
            class_name:  "CartProduct",
            # foreign_key: "product_id",
            dependent: :destroy
    has_many :order_products,dependent: :destroy
    attachment :product_image
    belongs_to :product_category
>>>>>>> Stashed changes
end
