class KudosController < ApplicationController

  before_action :set_kudo, only: [:show, :edit, :update, :destroy]

  def index
    @kudos = Kudo.all
  end

  def new
    @kudo = Kudo.new
  end

  def create
    @kudo = Kudo.new(kudo_params)
    @kudo.from = current_user
    if @kudo.save
      flash[:notice] = "Kudos has been created."
      redirect_to @kudo
    else
      flash.now[:alert] = "Kudos has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kudo.update(kudo_params)
      flash[:notice] = "Kudos has been updated."
      redirect_to @kudo
    else
      flash.now[:alert] = "Kudos has not been updated."
      render "edit"
    end
  end

  def destroy
    @kudo.destroy
    flash[:notice] = "Kudos has been deleted."
    redirect_to kudos_path
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
