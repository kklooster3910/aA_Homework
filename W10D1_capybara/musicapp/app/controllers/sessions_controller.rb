class SessionsController < ApplicationController
    
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        # debugger
        if user
            log_in(user)
            flash[:success] = "Welcome! Login Successful"
            redirect_to user_url(user.id)
        else
            flash[:error] = "Try again with the right credentials!"
            render :new, status: 401
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end

    private

    def session_params
        params.require(:session).permit(:email, :password)
    end
    
end