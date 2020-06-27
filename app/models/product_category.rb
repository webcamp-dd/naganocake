class ProductCategory < ApplicationRecord

    has_many :products,
    class_name:  "Product",
    foreign_key: "product_category_id",
    dependent: :destroy

    validates :name, presence: true

end
