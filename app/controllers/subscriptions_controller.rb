class SubscriptionsController < ApplicationController

    def create
        subscription = Subscription.create!(subscription_params)
        if subscription.valid?
            render json: subscription, status: :created
        else 
            render json: { errors: subscription.errors }, status: :unprocessable_entity
        end 
    end

    private 

    def subscription_params
        params.permit(:name , :provider, :category, :amount , :start_date, :billing_cycle) 
        
    end
end
