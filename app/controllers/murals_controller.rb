class MuralsController < ApplicationController
  def index
    @murals = Mural.order(params[:sort])
    # need to add strong parameters to this
  end

  def about

  end

  def new
    if current_user.present? && current_user.admin?
      @mural = Mural.new
    else
      redirect_to murals_path
    end
  end

  def create
    @mural = Mural.new(mural_params)
    if @mural.save
      flash[:notice] = "Mural saved."
      redirect_to murals_path
    else
      flash[:notice] = "Please try again."
      render :new
    end
  end

  def show
    @mural = Mural.find(params[:id])
    @hash = Gmaps4rails.build_markers(@mural) do |mural, marker|
      marker.lat mural.latitude
      marker.lng mural.longitude
      marker.infowindow mural.mural_name
    end
  end

  def edit
    if current_user.present? && current_user.admin?
      @mural = Mural.find(params[:id])
    else
      redirect_to murals_path
    end
  end

  def update
    @mural = Mural.find(params[:id])
    if @mural.update(mural_params)
      flash[:notice] = "This mural has been updated."
      redirect_to murals_path
    else
      flash[:notice] = "Please try again."
      render :edit
    end
  end

  def destroy
    @mural = Mural.find(params[:id])
    @mural.destroy
    redirect_to murals_path
  end

  private
  def mural_params
    params.require(:mural).permit(:mural_name, :year_created, :artist_name, :artist_name2, :artist_name3, :mural_address, :photo_credit, :attached_image, :region)
  end
end
