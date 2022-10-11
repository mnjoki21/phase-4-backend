class ProvidersController < ApplicationController

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
