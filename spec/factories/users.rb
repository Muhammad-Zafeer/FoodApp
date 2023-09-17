# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      email { Faker::Internet.unique.email }
      encrypted_password { Devise::Encryptor.digest(User, Faker::Internet.password) }
      reset_password_token { nil } # You can customize this if needed
      reset_password_sent_at { nil } # You can customize this if needed
      remember_created_at { nil } # You can customize this if needed
      created_at { Faker::Time.between(from: 1.year.ago, to: Time.now) }
      updated_at { Faker::Time.between(from: 1.year.ago, to: Time.now) }
    end
  end
  