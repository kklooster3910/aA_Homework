class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # debugger
            log_in(@user)
            flash[:success] = "Your Account has Successfully been Created!" ## where do I put this on the view? Does it go in the show? new? 
            redirect_to user_url(@user.id)
        else
            render :new, status: 422
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end


    # def index # not sure that I need this, I put this in there so that I could see if the users were being created
    #     render :show
    # end

    private

    def user_params
       params.require(:user).permit(:email, :password) 
    end

end