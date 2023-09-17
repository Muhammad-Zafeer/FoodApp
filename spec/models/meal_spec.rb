# spec/models/meal_spec.rb

require 'rails_helper'
category = FactoryBot.create(:category)
RSpec.describe Meal, type: :model do
  describe "Validations" do
    it "is valid with a valid price" do
      meal = FactoryBot.build(:meal, price: 10.99, category_id: category.id ) # Replace with a valid price
      expect(meal).to be_valid
    end

    it "is not valid without a price" do
      meal = FactoryBot.build(:meal, price: nil, category_id: category.id )
      expect(meal).not_to be_valid
      expect(meal.errors[:price]).to include("can't be blank")
    end
  end
end
