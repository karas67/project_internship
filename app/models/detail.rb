class Detail < ApplicationRecord
    validates :name, presence: true, length: {in: 2..50}
    validates :price, presence: true, numericality: true
    validates :quantity, presence: true, numericality: true
    
    has_many :order_details 
end
