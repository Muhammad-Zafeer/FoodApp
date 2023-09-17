# app/controllers/categories_controller.rb

class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
  
    # GET /categories
    def index
      @categories = Category.all
      render json: @categories
    end
  
    # GET /categories/1
    def show
      render json: @category
    end
  
    # GET /categories/new
    def new
      @category = Category.new
    end
  
    # POST /categories
    def create
      @category = Category.new(category_params)
      if @category.save
        render json: { status: 'Category was successfully created' }
      else
        render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /categories/1/edit
    def edit
    end
  
    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        render json: { status: 'Category was successfully updated' }
      else
        render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /categories/1
    def destroy
        if @category
            # Delete associated meals first
            @category.meals.destroy_all
        
            if @category.destroy
              render json: { status: 'Category and associated meals deleted successfully' }
            else
              render json: { error: 'Failed to delete category' }, status: :unprocessable_entity
            end
          else
            render json: { error: 'Category not found' }, status: :not_found
        end
    end

    def fetch_data
        CategoryFetchData.fetch_and_create_categories
    
        redirect_to categories_path, notice: 'Categories fetched and created successfully!'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by(id: params[:id])
      unless @category
        render json: { error: 'Category not found' }, status: :not_found
      end
    end
  
    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :category_description, :CategoryThumb)
    end
  end
  