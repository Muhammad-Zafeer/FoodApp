class AddColumnsToShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :cart_number, :string
    add_column :shopping_carts, :card_expire_date, :date
    add_column :shopping_carts, :card_user_name, :string
  end
end
