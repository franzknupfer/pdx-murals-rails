class MuralsController < ApplicationController
  def index
    @murals = Mural.all
    @hash = Gmaps4rails.build_markers(@murals) do |mural, marker|
      marker.lat mural.latitude
      marker.lng mural.longitude
      marker.infowindow %Q(<img src="#{mural.attached_image.url(:medium)}"><h1>#{mural.mural_name}</h1><h3>#{mural.artist_name}</h3>)
    end
  end

  def new
    @mural = Mural.new
  end

  def create
    @mural = Mural.new(mural_params)
    if @mural.save
      if (@mural.latitude || @mural.longitude) === nil
        flash[:notice] = "This address cannot be geocoded. Please enter a working address."
        render :new
      else
        flash[:notice] = "Mural saved."
        redirect_to murals_path
      end
    else
      flash[:notice] = "Please try again."
      render :new
    end
  end

  def show
    @mural = Mural.find(params[:id])
  end

  def edit
    @mural = Mural.find(params[:id])
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
    params.require(:mural).permit(:mural_name, :year_created, :artist_name, :artist_name2, :artist_name3, :mural_address, :photo_credit, :attached_image)
  end
end
