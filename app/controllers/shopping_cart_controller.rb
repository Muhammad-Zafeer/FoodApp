# app/controllers/shopping_carts_controller.rb

class ShoppingCartController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_shopping_cart, only: [:show, :update, :destroy]
  
    # POST /shopping_carts
    def create
      @shopping_cart = ShoppingCart.new(shopping_cart_params)
      #if time left for user auth
     #   @shopping_cart.user = current_user
  
      if @shopping_cart.save
        render json: @shopping_cart, status: :created
      else
        render json: { errors: @shopping_cart.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /shopping_carts/1
    def show
      render json: @shopping_cart
    end
  
    # PATCH/PUT /shopping_carts/1
    def update
      if @shopping_cart.update(shopping_cart_params)
        render json: @shopping_cart
      else
        render json: { errors: @shopping_cart.errors.full_messages }, status: :unprocessable_entity
      end
    end
  

  
    private
  
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end
  
    def shopping_cart_params
      params.require(:shopping_cart).permit(:cart_number,:card_expire_date,:card_user_name,:user_id)
    end
  end
  