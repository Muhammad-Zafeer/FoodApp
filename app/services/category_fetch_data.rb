# app/services/category_api_service.rb

class CategoryFetchData

    def self.fetch_and_create_categories
      category_api_url = 'https://www.themealdb.com/api/json/v1/1/categories.php'
  
      uri = URI(category_api_url)
      response = Net::HTTP.get(uri)
  
      data = JSON.parse(response)
  
      data['categories'].each do |category_data|
        Category.create(
          name: category_data['strCategory'],
          CategoryThumb: category_data['strCategoryThumb'],
          category_description: category_data['strCategoryDescription']
        )
      end
    end

  end
