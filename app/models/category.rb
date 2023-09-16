class Category < ApplicationRecord
    has_many :meals
  
    validates :name, presence: true
    validates :category_description, presence: true
  
    # Ensure CategoryThumb is a string attribute
    validates :CategoryThumb, presence: true, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }
end