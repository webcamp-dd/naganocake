class Order < ApplicationRecord

    after_initialize :set_default_values

    belongs_to :customer
    has_many :cart_products, class_name: 'CartProduct', dependent: :destroy
    has_many :order_products, class_name: 'OrderProduct', dependent: :destroy
    enum payment: { creditcard: 0, bank: 1}
    enum status: {
        入金待ち:  0, #入金待ち
        入金確認:  1, #入金確認
        製作中:    2, #製作中
        発送準備中: 3, #発送準備中
        発送済み:  4 #発送済み
    }

    private
    def set_default_values
      self.status      ||= 0
  end

end
