class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_credentials(params[:users][:email], params[:users][:password])

        if @user
            login!(@user)
            redirect_to bands_url
        else
            flash.now[:errors] = ['Invalid credentials.']
            render :new
        end
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end
end
