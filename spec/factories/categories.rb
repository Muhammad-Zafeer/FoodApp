# spec/factories/categories.rb

FactoryBot.define do
  factory :category do
    name { Faker::Food.dish }
    category_description { Faker::Lorem.sentence }
    CategoryThumb { Faker::Internet.url }
  end
end

  