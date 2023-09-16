class AddShoppingCartReferenceToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :cart_items, :shopping_cart, null: false, foreign_key: true
  end
end
