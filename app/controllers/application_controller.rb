class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected

  def current_user_address
    if Rails.env.test? || Rails.env.development?
      session[:current_user_address] ||= '405 Howard Street, San Francisco, CA, 94105'
    else
      session[:current_user_address] ||= request.location.address
    end
  end

end
