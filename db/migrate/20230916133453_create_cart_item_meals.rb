class CreateCartItemMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_item_meals do |t|
      t.references :cart_item, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
