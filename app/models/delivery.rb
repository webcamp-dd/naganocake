class Delivery < ApplicationRecord
    belongs_to :customer
    validates :postal_code, 
                presence: true,
                numericality: true
    validates :address, presence: true
    validates :name, presence: true
    def total_address
        self.postal_code + self.address + self.name
    end
end
