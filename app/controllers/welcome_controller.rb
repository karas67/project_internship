class WelcomeController < ApplicationController
    def index; 
        @name = Order.group(:name).count
    end
end
