class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading, :email, :encrypted_password, :birth_date)
  end

end
