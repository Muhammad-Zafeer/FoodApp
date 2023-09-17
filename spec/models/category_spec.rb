# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      category = FactoryBot.build(:category, name: "Example Category", category_description: "Description", CategoryThumb: "https://example.com/image.jpg")
      expect(category).to be_valid
    end

    it "is not valid without a name" do
      category = FactoryBot.build(:category, name: nil)
      expect(category).not_to be_valid
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "is not valid without a category_description" do
      category = FactoryBot.build(:category, category_description: nil)
      expect(category).not_to be_valid
      expect(category.errors[:category_description]).to include("can't be blank")
    end

    it "is not valid without a valid CategoryThumb URL" do
      category = FactoryBot.build(:category, CategoryThumb: "invalid-url")
      expect(category).not_to be_valid
      expect(category.errors[:CategoryThumb]).to include("must be a valid URL")
    end
  end
end
