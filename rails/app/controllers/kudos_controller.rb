class KudosController < ApplicationController

  def index
    @kudos = Kudo.all
  end

  def new
    @kudo = Kudo.new
  end

  def create
    @kudo = Kudo.new(kudo_params)
    if @kudo.save
      flash[:notice] = "Kudos has been created."
      redirect_to @kudo
    else
      flash.now[:alert] = "Kudos has not been created."
      render "new"
    end
  end

  def kudo_params
    params.require(:kudo).permit(:from, :to, :for)
  end

  def show
    @kudo = Kudo.find(params[:id])
  end

  def edit
    @kudo = Kudo.find(params[:id])
  end

  def update
    @kudo = Kudo.find(params[:id])

    if @kudo.update(kudo_params)
      flash[:notice] = "Kudos has been updated."
      redirect_to @kudo
    else
      flash.now[:alert] = "Kudos has not been updated."
      render "edit"
    end
  end

  def destroy
    @kudo = Kudo.find(params[:id])
    @kudo.destroy
    flash[:notice] = "Kudos has been deleted."
    redirect_to kudos_path
  end
end
