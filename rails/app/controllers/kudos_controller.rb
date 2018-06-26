class KudosController < ApplicationController

  def index
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
      # nothing, yet
    end
  end

  def kudo_params
    params.require(:kudo).permit(:from, :to, :for)
  end

  def show
    @kudo = Kudo.find(params[:id])
  end
end
