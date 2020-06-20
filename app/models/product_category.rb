class ProductCategory < ApplicationRecord
    has_many :product,
    class_name:  "Product",
    foreign_key: "product_category_id",
    dependent: :destroy
end
