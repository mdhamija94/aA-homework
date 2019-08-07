class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      render json: @user.errors.full_messages
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    render :show
  end

  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
