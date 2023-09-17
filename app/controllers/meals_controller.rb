# app/controllers/meals_controller.rb

class MealsController < ApplicationController
    before_action :find_meal, only: [:show, :update, :destroy]
  
    def index
      @meals = Meal.all
      render json: @meals
    end
  
    def show
      render json: @meal
    end
  
    def create
      @meal = Meal.new(meal_params)
      if @meal.save
        render json: @meal, status: :created
      else
        render json: @meal.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @meal.update(meal_params)
        render json: @meal
      else
        render json: @meal.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @meal.destroy
        render json: { message: 'Meal deleted successfully' }
      else
        render json: { error: 'Failed to delete meal' }, status: :unprocessable_entity
      end
    end
      

    def fetch_meals
      MealFetchService.fetch_and_create_meals
        
      redirect_to meals_path json: { message: 'Meals fetched and created successfully.' }
    end
  
    private
  
    def find_meal
        @meal = Meal.find_by(id: params[:id])
        unless @meal
          render json: { error: 'Meal not found' }, status: :not_found
        end
    end
      
  
    def meal_params
      params.require(:meal).permit(:meal, :meal_thumb, :category_id, :price)
    end
  end
  