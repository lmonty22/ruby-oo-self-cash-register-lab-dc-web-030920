
require 'pry'

class CashRegister
    attr_accessor :total, :items
    attr_reader :discount 

    def initialize(discount= nil)
        @total = 0 
        @discount = discount
        @items = []
    end


    def add_item(title, price, quantity=1)
        @last_title = title
        @last_price = price
        @last_quantity = quantity
        @total+= price*quantity
        quantity.times do 
        @items << title
    end

    end

    def apply_discount
        #this is not correct... 
        if @discount
            #change discount to float and divide by 100
            @discount = (@discount.to_f)/100
            @total -= @total*@discount
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
         return "There is no discount to apply."
        end
    end


    def void_last_transaction 
        #need to use self here
        @total -= @last_price*@last_quantity
    end
end