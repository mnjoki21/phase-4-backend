class SubscriptionsController < ApplicationController

    # get/subscriptions
    def index 
        subscriptions = Subscription.all
        render json: subscriptions
    end
    
    # get/subscriptions/:id
    def show
        subscription = Subscription.find_by(id: parmas[:id])
        if subscription
            render json: subscription 
        else
            render json: { error: "subscription not available" }, status: :not_found
        end 
    end
    # post/subscription/:id

    def create
        subscription = Subscription.create!(subscription_params) 
        if subscription.valid?
            render json: subscription, status: :created 
        else
            render json: { errors: subscription.errors }, status: :unprocessable_entity
        end  
    end

    def update
        subscription = Subscription.find_by(params[:id])
        if subscription
            subscription.update(subscription_params)
            render json: subscription
        else
            render json: { error: "no subscription here" }, status: :not_found    
        end 
        
    end

    def destroy
        subscription = Subscription.find(params[:id])
        if subscription
            subscription.destroy
            head :no_content
        else
            render json: {error: "Subscription not found"}, status: :not_found
        end

        
    end

    private

    def subscription_params
        params.permit(:name, :amount, :start_date, :billing_cycle)
        
    end
end
