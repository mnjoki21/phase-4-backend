class CategoriesController < ApplicationController
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
