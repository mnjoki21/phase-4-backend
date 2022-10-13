class UsersController < ApplicationController
     skip_before_action :authorize

    def index
        users = User.all
        render json: users 
    end

    def create
        user = User.create(user_params)
    #     if user.valid?
    #     session[:user_id] = user.id 
    #     render json: user, status: :created 
    #    else
    #     render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    #     end
        if user.valid? && params[:password] == params[:password_confirmation]
            user.save!
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        render json: @current_user  
    end

    private


    def user_params
        params.permit(:email, :password, :password_confirmation) 
    end
 
end
