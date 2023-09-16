class RenameMealAttributes < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :Meal, :meal
    rename_column :meals, :MealThumb, :meal_thumb
  end
end
