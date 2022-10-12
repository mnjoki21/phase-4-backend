class CategoriesController < ApplicationController
    
    # get/categories
    def index 
        categories = Category.all
        render json: categories
    end
    
    # get/categories/:id
    def show
        category = Category.find_by(id: parmas[:id])
        if category
            render json: category 
        else
            render json: { error: "category not available" }, status: :not_found
        end 
    end
    
    # post/categories/:id
    def create
        category= Category.create!(provider_params)
        if category.valid?
            render json: category, status: :created 
        else
            render json: { errors: category.errors }, status: :unprocessable_entity            
        end
        
    end

    private

    def category_params
        params.permit(:name)

    end
end
