

FactoryBot.define do
    factory :meal do
      meal { Faker::Food.dish }
      meal_thumb { Faker::Internet.url }
      created_at { Faker::Time.between(from: 1.year.ago, to: Time.now) }
      updated_at { Faker::Time.between(from: created_at, to: Time.now) }
      category_id { Faker::Number.between(from: 1, to: 10) } # Replace with the desired category ID range
      price { Faker::Commerce.price(range: 5.0..20.0, as_string: true) } # Replace with the desired price range
    end
  end
  