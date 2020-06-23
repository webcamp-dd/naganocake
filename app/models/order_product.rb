class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    enum status: {
    	着手不可: 0,
    	製作待ち: 1,
    	製作中: 2,
    	製作完了: 3
    }

    after_initialize :set_default_values

     private

  def set_default_values
  	self.status ||=0
  end
end
