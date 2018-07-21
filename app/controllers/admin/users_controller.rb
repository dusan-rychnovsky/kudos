class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    # InvitationMailer.invited(@user).deliver_now
    @user.send_reset_password_instructions
    flash[:notice] = "Invitation has been sent."
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to admin_users_path
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
