class OrderDetail < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true

  belongs_to :order
  belongs_to :detail
end
