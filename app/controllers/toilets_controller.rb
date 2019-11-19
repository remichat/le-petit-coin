class ToiletsController < ApplicationController
  def index
    @toilets = Toilet.all
  end

  def new
    @toilet = Toilet.new
  end

  def show
    @toilet = Toilet.find(params[:id])
  end

  def create
    @toilet = Toilet.new(toilet_params)
    @toilet.user = current_user

    if @toilet.save
      redirect_to toilets_path
    else
      render :new
    end
  end

  private

  def toilet_params
    params.require(:toilet).permit(:title, :description, :address, :toilet_type, :capacity, :gender, :is_noiseproof, :is_pro)
  end
end
