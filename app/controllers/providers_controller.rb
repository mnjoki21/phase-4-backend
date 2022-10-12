class ProvidersController < ApplicationController

     # get/providers
    def index 
        providers = Category.all
        render json: providers
    end
    
    # get/providers/:id
    def show
        provider = Category.find_by(id: parmas[:id])
        if provider
            render json: provider 
        else
            render json: { error: "provider not available" }, status: :not_found
        end 
    end
#    post /providers/:id
    def create
        provider = Provider.create!(provider_params)
        if provider.valid?
            render json: provider, status: :created 
        else
            render json: { errors: provider.errors }, status: :unprocessable_entity            
        end
        
    end
    
    private

    def provider_params
        params.permit(:name, :logo) 
        
    end
end
