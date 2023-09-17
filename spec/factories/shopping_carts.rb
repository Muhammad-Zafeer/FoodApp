# spec/factories/shopping_carts.rb

FactoryBot.define do
    factory :shopping_cart do
      user_id { FactoryBot.create(:user).id } # If your ShoppingCart belongs_to User
      cart_number { Faker::Number.number(digits: 16).to_s } # Generates a 16-digit string
      card_expire_date { Faker::Date.forward(days: 365) } # Generates a random date within the next year
      card_user_name { Faker::Name.name } # Generates a random name
  
      # You can customize these attributes based on your model's associations and requirements.
    end
  end
  