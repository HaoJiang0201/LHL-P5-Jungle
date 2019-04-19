class UsersController < ApplicationController

    def new
    end

    def create
        
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Successfully Created User!"
            redirect_to '/'
        else
            flash[:warning] = "Invalid Email or Password!"
            redirect_to '/signup'
        end


        # @user = User.new(params[:user])
 
        respond_to do |format|
            if @user.save
                # Tell the UserMailer to send a welcome email after save
                UserMailer.welcome_email(@user).deliver_later
        
                format.html { redirect_to(@user, notice: 'User was successfully created.')}
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end

    end

    class SendWeeklySummary
        def run
            User.find_each do |user|
            UserMailer.weekly_summary(user).deliver_now
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
