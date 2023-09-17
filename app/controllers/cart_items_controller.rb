class CartItemsController < ApplicationController

    before_action :find_cart_item, only: :add_meal
    before_action :find_meal, only: :add_meal



   def add_meal
    @cart_item.meals << @meal
    @cart_item.update(quantity: @cart_item.meals.count)
    @cart_item.update(price: @cart_item.meals.sum(:price))

    render json: @cart_item, status: :ok
   end

   


    
    
  private
    def find_cart_item
        @cart_item = CartItem.find_by(id: params[:id])
        unless @cart_item
          render json: { error: 'Cart item not found' }, status: :not_found
        end
    end

    def find_meal
        @meal = Meal.find_by(id: params[:meal_id])
        unless @meal
          render json: { error: 'Meal not found' }, status: :not_found
        end
    end
end
