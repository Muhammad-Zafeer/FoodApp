class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :Meal
      t.string :MealThumb

      t.timestamps
    end
  end
end
