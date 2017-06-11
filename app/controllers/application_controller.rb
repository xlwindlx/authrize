class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
  end
end
