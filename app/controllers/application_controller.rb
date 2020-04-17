class ApplicationController < ActionController::Base
    # prevent CSRF attacks by raising an exception
    protect_from_forgery with: :exception
    helper_method :logged_in?, :authorized

    # before_action :require_login
    # skip_before_action :require_login, only: [:index, :login, :signup]

    # before_action :authorized
    # skip_before_action :authorized, only: [:new, :create]


    def authorized
        redirect_to login_path unless logged_in?
    end

    def current_user
        @current_user ||= User.find_by(id: session[:email])
    end
      
    def logged_in?
        !current_user.nil?
    end

private
 
  def require_login
    return head(:forbidden) unless session.include? :email
  end


end
