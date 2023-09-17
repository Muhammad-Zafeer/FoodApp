# spec/factories/cart_items.rb

FactoryBot.define do
    factory :cart_item do
      name { Faker::Food.dish } # Example: "Spaghetti Bolognese"
      quantity { Faker::Number.between(from: 1, to: 10) } # Example: 3
      price { Faker::Commerce.price(range: 1.0..20.0, as_string: false) } # Example: 15.99
      created_at { Faker::Time.between(from: 1.year.ago, to: Time.now) }
      updated_at { Faker::Time.between(from: 1.year.ago, to: Time.now) }
      shopping_cart { FactoryBot.create(:shopping_cart) } # If CartItem belongs_to ShoppingCart
  
      # You can customize these attributes based on your model's associations and requirements.
    end
  end
  