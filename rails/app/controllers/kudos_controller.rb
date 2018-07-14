class KudosController < ApplicationController

  before_action :set_kudo, only: [:show]

  def index
    @users = User.preload(:kudos_to).all
  end

  def new
    authenticate_user!
    @kudo = Kudo.new
  end

  def create
    authenticate_user!
    @kudo = Kudo.new(kudo_params)
    @kudo.from = current_user
    if @kudo.save
      flash[:notice] = "Kudos has been created."
      redirect_to user_path(@kudo.to_id)
    else
      flash.now[:alert] = "Kudos has not been created."
      render "new"
    end
  end

private

  def kudo_params
    params.require(:kudo).permit(:to_id, :for)
  end

  def set_kudo
    @kudo = Kudo.find(params[:id])
  rescue
    flash[:alert] = "The Kudos you were looking for could not be found."
    redirect_to kudos_path
  end
end
