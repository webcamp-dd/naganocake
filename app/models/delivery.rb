class Delivery < ApplicationRecord
    belongs_to :customer
    def total_address
        self.postal_code + self.address + self.name
        
    end
end
