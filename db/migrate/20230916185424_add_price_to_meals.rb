class AddPriceToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :price, :decimal
  end
end
