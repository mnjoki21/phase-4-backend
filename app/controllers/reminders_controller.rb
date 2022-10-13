class RemindersController < ApplicationController

     
     # get/reminders
    def index 
        reminders = Category.all
        render json: reminders
    end
    
    # get/reminders/:id
    def show
        reminder = Category.find_by(id: parmas[:id])
        if reminder
            render json: reminder 
        else
            render json: { error: "reminder not available" }, status: :not_found
        end 
    end

    # post/reminder/:id
    def create
        reminder = Reminder.create!(reminder_params)
        if reminder.valid?
            render json: reminder, status: :created 
        else
            render json: { errors: reminder.errors },  status: :unprocessable_entity
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
        params.permit(:provider, :category, :subscription)

    end
 []
end
