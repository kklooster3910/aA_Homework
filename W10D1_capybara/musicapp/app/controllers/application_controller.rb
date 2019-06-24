class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token

    helper_method :current_user, :logged_in?

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token]) # need to use lazy assignment, why isn't this working in the application.html.erb view?
    end

    def log_in(user) 
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!self.current_user
    end

end
