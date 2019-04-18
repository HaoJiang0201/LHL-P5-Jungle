class UsersController < ApplicationController

    def new
    end

   

    def create
        # user = User.new(
        #     name: params[:name],
        #     email: params[:email],
        #     password: params[:password],
        #     password_confirmation: params[:password_confirmation]
        # )
        # if user.save
        #     session[:user_id] = user.id
        #     flash[:success] = "Successfully Created User!"
        #     redirect_to '/products'
        # else
        #     flash[:warning] = "Invalid Email or Password!"
        #     redirect_to '/signup'
        # end
        
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            flash[:success] = "Successfully Created User!"
            redirect_to '/'
        else
            flash[:warning] = "Invalid Email or Password!"
            redirect_to '/signup'
        end

    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
