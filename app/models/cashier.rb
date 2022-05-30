class Cashier < ApplicationRecord
    validates :first_name, presence: true, length: {in: 2..25}
    validates :last_name, presence: true, length: {in: 2..25} 
    validates :password, presence: true, length: {in: 6..20}
    validates :email, presence: true, uniqueness: true, format: { with:
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: 'Only emails allowed' }
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :confirmable
        
    has_many :orders
end
