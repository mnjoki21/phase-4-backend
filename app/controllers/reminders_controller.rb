class RemindersController < ApplicationController

    def create
        reminder = Reminder.create!(reminder_params)
        if reminder.valid?
            render json: reminder, :status: :created 
        else
            render json: { errors: reminder.errors }, status: :unprocessable_entity 
        end 
    end


    private

    def reminder_params
        params.permit(:name , :status ,:due_date, :user_id)
    end 
end
