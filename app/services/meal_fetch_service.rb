# app/services/meal_fetch_service.rb

class MealFetchService
    def self.fetch_and_create_meals
      url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Breakfast'
      response = HTTParty.get(url)
  
      if response.code == 200
        meals_data = JSON.parse(response.body)['meals']
        breakfast_category = Category.find_or_create_by(name: 'Breakfast') # Find or create the Breakfast category
  
        meals_data.each do |meal_data|
          Meal.create(
            meal: meal_data['strMeal'],
            meal_thumb: meal_data['strMealThumb'],
            category: breakfast_category # Associate the meal with the Breakfast category
          )
        end
      end
    end
  end
  