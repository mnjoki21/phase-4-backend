class RemindersController < ApplicationController

    def create
        reminder = Reminder.create!(reminder_params)
        if reminder.valid?
            render json: reminder, status: :created 
        else
            render json: { errors: reminder.errors }, status: :unprocessable_entity 
        end 
    end

    def update 
        reminder = Reminder.find_by(params[:id])
        if reminder
            reminder.update(reminder_params)
            render json: reminder
        else
            render json: { error: "reminder not created yet" }, status: :not_found
        end
        
    end


    private

    def reminder_params
        params.permit(:name , :status ,:due_date, :user_id)
    end 
end
