class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_products,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :family_name, length: {maximum: 20, minimum: 1}
  validates :first_name, length: {maximum: 20, minimum: 1}
  validates :kana_family_name, length: {maximum: 20, minimum: 1}
  validates :kana_first_name, length: {maximum: 20, minimum: 1}
  validates :postal_code, length: { is: 7 }
  validates :phone_number, length: { in: 10..11 }


  acts_as_paranoid
end
