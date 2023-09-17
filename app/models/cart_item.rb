class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  has_many :cart_item_meals
  has_many :meals, through: :cart_item_meals
  
end
