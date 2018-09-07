class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # I'm gonna overwrite the record not found method, I don't need all the trace
  # Only the 404 not found and a message
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {success: false, message: 'Record not found, please verify your info'}, status: :not_found
  end
end
