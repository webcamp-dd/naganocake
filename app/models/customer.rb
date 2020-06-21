class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_products,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :deliveries, class_name: 'Delivery', dependent: :destroy
end
