class Order < ApplicationRecord
    validates :date, presence: true
    validates :name, presence: true, length: {in: 2..25} 
    validates :amount, presence: true, numericality: true 

    belongs_to :cashier
    has_many :order_details
end
