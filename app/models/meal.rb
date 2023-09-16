class Meal < ApplicationRecord
  belongs_to :category
  has_many :cart_item_meals
  has_many :cart_items, through: :cart_item_meals
end
