class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def forbidden_request
  render json: {
    error: [ "Forbidden" ],
  }, status: 403
  end
  
end
