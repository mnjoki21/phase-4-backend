class ApplicationController < ActionController::API
    include ActionController::Cookies

# rescue_from ActiveRecord::RecordInvalid, with: :entity_unread

before_action :authorize

private 
    def authorize
      return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
      #  @current_user = User.find_by(id: session[:user_id])
      
      #  render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user 
    end

    # def entity_unread(invalid)
    #   render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity  
    # end
end
