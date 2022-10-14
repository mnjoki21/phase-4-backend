# class ApplicationController < ActionController::API
#     include ActionController::Cookies

# # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

# before_action :authorizez                                 

# private 

#     def authorize
#        @current_user = User.find_by(id: session[:user_id])
#       return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id

#     end

#     # def render_unprocessable_entity_response(invalid)
#     #   render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity  
#     # end
# end

class ApplicationController < ActionController::API

  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize

  skip_before_action :authorize, only: [:index, :create, :show, :destroy]
  
  private
  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end
  def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end