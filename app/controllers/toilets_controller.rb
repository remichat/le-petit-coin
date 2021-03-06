class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @toilets = Toilet.near(params[:query], 3).where.not(user: current_user)

    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { toilet: toilet })
      }
    end
  end

  def new
    @toilet = Toilet.new
    @page_title = "toilet_new"
  end

  def show
    @toilet = Toilet.find(params[:id])
    @booking = Booking.new
    @markers =
      [{
        lat: @toilet.latitude,
        lng: @toilet.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { toilet: @toilet })
      }]
  end

  def create
    @toilet = Toilet.new(toilet_params)
    @toilet.user = current_user

    if @toilet.save
      redirect_to edit_toilet_path(@toilet)
    else
      render :new
    end
  end

  def edit
    @toilet = Toilet.find(params[:id])
    if @toilet.toilet_type.nil?
      render :edit
    elsif @toilet.capacity.nil?
      render :edit_2
    elsif @toilet.title.nil?
      render :edit_3
    end
  end

  def update
    @toilet = Toilet.find(params[:id])
    @toilet.update(toilet_params)
    if @toilet.finished?
      redirect_to toilets_path(@toilet)
    elsif @toilet.title.nil?
      redirect_to edit_toilet_path(@toilet)
    end
  end

  private

  def toilet_params
    # return nil if params[:toilet].nil?

    params.require(:toilet).permit(:title, :description, :address, :toilet_type, :capacity, :gender, :is_noiseproof, :is_pro)
  end
end
