class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @kudos = @user.kudos_to
  end
end
