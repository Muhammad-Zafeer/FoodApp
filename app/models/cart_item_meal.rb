class CartItemMeal < ApplicationRecord
  belongs_to :cart_item
  belongs_to :meal
end
