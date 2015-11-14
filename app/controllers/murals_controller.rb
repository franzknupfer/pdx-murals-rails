class MuralsController < ApplicationController
  def index
    @murals = Mural.all
  end

  def show
  end

  def new
    @mural = Mural.new
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

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def mural_params
    params.require(:mural).permit(:mural_name, :year_created, :artist_name, :artist_name2, :artist_name3, :mural_address, :photo_credit, :attached_image)
  end
end
